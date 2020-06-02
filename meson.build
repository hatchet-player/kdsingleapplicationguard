# kdsingle project build file
#============================================================================




# init
#============================================================================


# init project
#-------------------------------------------------
project(
    'kdsingleapplicationguard',
    ['c', 'cpp'],
    default_options : [
        'cpp_std=c++11',
        'warning_level=3',
        'optimization=3',
        'debug=true'
    ],
    version : run_command(
        'python', '-c', 
        '''with open('./VERSION','r') as f: print(f.read());''' ).stdout().strip(),
    license : 'LGPL'
)


# init compiler 
#-------------------------------------------------
c = meson.get_compiler('c')
cpp = meson.get_compiler('cpp')

add_project_arguments(get_option('cxxflags'), language : 'cpp')
add_project_link_arguments(get_option('ldflags'), language: 'cpp')

qt5 = import('qt5')
cmake = import('cmake')
pkg = import('pkgconfig')
sys_name = host_machine.system().to_lower()


# init configuration
#-------------------------------------------------
config_h = configuration_data()

config_h.set(
    'HAVE_CXX17', 1,
    description : 'Define if the compiler supports basic C++17 syntax')

package_name = meson.project_name()
config_h.set_quoted(
    'PACKAGE_NAME', package_name,
    description : 'Define to the full name of this package.'
    )

package_tarname = meson.project_name()
config_h.set_quoted(
    'PACKAGE_TARNAME', package_tarname,
    description : 'Define to the one symbol short name of this package.')

package_version = meson.project_version()
config_h.set_quoted(
    'PACKAGE_VERSION', package_version,
    description : 'Define to the version of this package.')

package_string = '@0@ @1@'.format(package_name, package_version)
config_h.set_quoted(
    'PACKAGE_STRING', package_string,
    description : 'Define to the full name and version of this package.')

package_url = 'https://ever3st.com'
config_h.set_quoted(
    'PACKAGE_URL', package_url,
    description : 'Define to the home page for this package.')

package_bug_url = 'https://github.com/p01arst0rm/kdsingleapplicationguard/issues'
config_h.set_quoted(
    'PACKAGE_BUGREPORT', package_bug_url,
    description : 'Define to the address where bug reports for this' +
    'package should be sent.')


# env
#============================================================================


# set install directories
#-------------------------------------------------
prefix = get_option('prefix')
libdir = join_paths(prefix, get_option('libdir'))
bindir = join_paths(prefix, get_option('bindir'))
datadir = join_paths(prefix, get_option('datadir'))
sysconfdir = join_paths(prefix, get_option('sysconfdir'))
libexecdir = join_paths(prefix, get_option('libexecdir'))
mandir = join_paths(prefix, get_option('mandir'))
includedir = join_paths(prefix, get_option('includedir'))


# checking headers
#============================================================================






# checking functions
#============================================================================






# checking data types
#============================================================================




# required dependancies
#============================================================================


# look for required programs
#--------------------------------------------------
git = find_program('git', required : true)


# Look for qt5, a required dependency.
#-------------------------------------------------
qt5_link_args = get_option('qt5_link_args')
qt5_mod_list = [
    'Core',
    'Concurrent',
    'Gui',
    'Network',
    'Sql',
    'Svg',
    'UiTools',
    'WebKitWidgets',
    'Widgets',
    'Xml']

check_qt5_x11 = dependency(
    'qt5', modules : 'X11Extras', required : false).found()

if (check_qt5_x11)
    qt5_mod_list += 'X11Extras'
    qt5_link_args += get_option('qt5_x11_link_args')
    config_h.set(   
        'HAVE_X11', 1,
        description : 'Whether to build with QT5 X11 support')
endif

qt5_dep = declare_dependency(
    link_args : qt5_link_args,
    dependencies : [ dependency(
        'qt5',
        modules: qt5_mod_list)])

if (qt5_dep.found())
    config_h.set(
        'HAVE_QT5', 1,
        description : 
            'Provides support for installation of resolvers from the' +
            'Tomahawk website')
endif


# build
#============================================================================


# build conf
#-------------------------------------------------
conf = configure_file(
    output : 'config.h',
    configuration : config_h)

add_project_arguments('-include', 'config.h', language : 'cpp')


# install headers
#-------------------------------------------------
install_headers(
    conf,
    install_dir : join_paths(includedir, 'portfwd'))


# build kdsingleapplicationguard
#-------------------------------------------------
kdsingle_inc = [include_directories('.')]


project_dirs = [
    'src']


foreach dir : project_dirs
    subdir(dir)
endforeach

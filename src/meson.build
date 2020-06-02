# thirdparty.kdsingleapplicationguard build file
#============================================================================


single_app_guard_dir = meson.current_source_dir()
kdsingle_inc += include_directories('.')


single_app_guard_src = files(
    join_paths(single_app_guard_dir, 'kdsingleapplicationguard.cpp'),
    join_paths(single_app_guard_dir, 'kdsharedmemorylocker.cpp'),
    join_paths(single_app_guard_dir, 'kdtoolsglobal.cpp'),
    join_paths(single_app_guard_dir, 'kdlockedsharedmemorypointer.cpp'),
    join_paths(single_app_guard_dir, 'pimpl_ptr.cpp'))


single_app_guard_moc_src = files(
    join_paths(single_app_guard_dir, 'kdsingleapplicationguard.cpp'))


single_app_guard_moc_h = files(
    join_paths(single_app_guard_dir, 'kdsingleapplicationguard.h'))



# Link args
#============================================================================


single_app_guard_link_list = []


single_app_guard_link_args = []


# dependancies
#============================================================================

single_app_guard_dep_list = [
    qt5_dep]


# build
#============================================================================


single_app_guard_moc = [] 
single_app_guard_moc += qt5.preprocess(
    moc_sources : single_app_guard_moc_src,
    moc_headers : single_app_guard_moc_h,
    include_directories : kdsingle_inc)


single_app_guard_lib = library(
    'kdsingleapplicationguard',
    install : true,
    install_mode : 'rwxr-xr-x',
    install_dir : libdir,
    include_directories : kdsingle_inc,
    sources : [
        single_app_guard_moc,
        single_app_guard_src],
    link_with : single_app_guard_link_list,
    link_args : single_app_guard_link_args,
    dependencies : single_app_guard_dep_list)

single_app_guard_dep = declare_dependency(
    link_with : single_app_guard_lib,
    include_directories : kdsingle_inc
)
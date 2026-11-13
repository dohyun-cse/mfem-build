# petsc-tpl + HiOp, without PETSc itself.
include_guard(GLOBAL)
include(${CMAKE_CURRENT_LIST_DIR}/petsc-tpl.cmake)
mfem_build_require(nopetsc HIOP_DIR)
set(MFEM_USE_HIOP YES CACHE BOOL "")

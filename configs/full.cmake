# nopetsc + PETSc.
include_guard(GLOBAL)
include(${CMAKE_CURRENT_LIST_DIR}/nopetsc.cmake)
set(MFEM_USE_PETSC YES CACHE BOOL "")

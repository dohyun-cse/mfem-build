# hypre, METIS, ParMETIS, SuiteSparse, MUMPS, ScaLAPACK and OpenBLAS from a
# PETSc build (see build-petsc.sh). PETSc itself is not enabled.
#
# MUMPS's dependencies are listed explicitly instead of importing the
# ScaLAPACK target of the PETSc build, whose link line carries PETSc's
# BLAS/Fortran flags verbatim (with duplicates). BLAS and LAPACK are the
# same OpenBLAS that PETSc, MUMPS and ScaLAPACK were built with.
include_guard(GLOBAL)
mfem_build_require(petsc-tpl PETSC_DIR PETSC_ARCH PETSC_BUILD_DIR
                   SHLIB_SUFFIX FORTRAN_RUNTIME_LIBRARIES)
set(_petsc_lib "${PETSC_BUILD_DIR}/lib")

set(HYPRE_DIR "${PETSC_BUILD_DIR}" CACHE PATH "")
set(MFEM_USE_METIS_5 YES CACHE BOOL "")
set(METIS_DIR "${PETSC_BUILD_DIR}" CACHE PATH "")
set(ParMETIS_DIR "${PETSC_BUILD_DIR}" CACHE PATH "")
set(MFEM_USE_SUITESPARSE YES CACHE BOOL "")
set(SuiteSparse_DIR "${PETSC_BUILD_DIR}" CACHE PATH "")

set(MFEM_USE_LAPACK YES CACHE BOOL "")
set(BLA_VENDOR "OpenBLAS" CACHE STRING "")
set(CMAKE_LIBRARY_PATH "${_petsc_lib}" CACHE PATH "")

set(MFEM_USE_MUMPS YES CACHE BOOL "")
set(MUMPS_DIR "${PETSC_BUILD_DIR}" CACHE PATH "")
set(MUMPS_REQUIRED_PACKAGES "MPI" "MPI_Fortran" "ParMETIS" "METIS"
    CACHE STRING "")
set(MUMPS_REQUIRED_LIBRARIES
    "${_petsc_lib}/libscalapack${SHLIB_SUFFIX}"
    "${_petsc_lib}/libopenblas${SHLIB_SUFFIX}"
    ${FORTRAN_RUNTIME_LIBRARIES}
    CACHE STRING "")

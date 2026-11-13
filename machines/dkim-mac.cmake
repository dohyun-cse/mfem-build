# Dohyun's MacBook (Apple Silicon, Homebrew open-mpi, TPLs in ~/mfem).
set(TPL_ROOT "$ENV{HOME}/mfem" CACHE PATH "")

# The stable Homebrew wrappers, not a versioned Cellar path.
set(MPI_C_COMPILER "/opt/homebrew/bin/mpicc" CACHE FILEPATH "")
set(MPI_CXX_COMPILER "/opt/homebrew/bin/mpicxx" CACHE FILEPATH "")
set(MPI_Fortran_COMPILER "/opt/homebrew/bin/mpif90" CACHE FILEPATH "")

set(METIS_5_DIR "${TPL_ROOT}/metis-5.1.0" CACHE PATH "")
set(PETSC_DIR "${TPL_ROOT}/petsc" CACHE PATH "")
set(PETSC_ARCH "arch-darwin-c-opt" CACHE STRING "")
set(PETSC_BUILD_DIR "${TPL_ROOT}/petsc/build" CACHE PATH "")
set(HIOP_DIR "${TPL_ROOT}/hiop/install" CACHE PATH "")
set(GSLIB_DIR "${TPL_ROOT}/gslib/build" CACHE PATH "")

set(SHLIB_SUFFIX ".dylib" CACHE STRING "")
# gfortran runtime for the static MUMPS libraries (stable Homebrew path).
set(FORTRAN_RUNTIME_LIBRARIES
    "/opt/homebrew/opt/gcc/lib/gcc/current/libgfortran${SHLIB_SUFFIX}"
    CACHE STRING "")

# Cached paths under these prefixes are checked for existence before each
# build (versioned Homebrew paths disappear on upgrades).
set(MFEM_BUILD_WATCH_PREFIXES "/opt/homebrew/Cellar" CACHE STRING "")

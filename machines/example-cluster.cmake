# Template for a cluster with modules and CUDA; copy to <machine>.cmake and
# list the host pattern in machines/hosts (or rely on the hostname).
# MFEM_BUILD_VARIANT is cpu or cuda/hip (from the -c layers), so TPLs built
# for each variant can live side by side.
set(TPL_ROOT "/usr/workspace/$ENV{USER}/tpl/${MFEM_BUILD_VARIANT}" CACHE PATH "")

set(MPI_C_COMPILER "/path/to/mpi/bin/mpicc" CACHE FILEPATH "")
set(MPI_CXX_COMPILER "/path/to/mpi/bin/mpicxx" CACHE FILEPATH "")
set(MPIEXEC_EXECUTABLE "srun" CACHE FILEPATH "")

set(CUDAToolkit_ROOT "/path/to/cuda" CACHE PATH "")
set(CMAKE_CUDA_ARCHITECTURES 90 CACHE STRING "")

set(PETSC_DIR "${TPL_ROOT}/petsc" CACHE PATH "")
set(PETSC_ARCH "arch-linux-c-opt" CACHE STRING "")
set(PETSC_BUILD_DIR "${TPL_ROOT}/petsc/build" CACHE PATH "")
set(HIOP_DIR "${TPL_ROOT}/hiop/install" CACHE PATH "")

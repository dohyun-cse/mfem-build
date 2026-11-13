# Brown CCV Oscar (spack openmpi 4.1.8, TPLs from ~/petsc/build). The cuda
# variant uses the same CPU TPLs: hypre stays on the host.
set(TPL_ROOT "$ENV{HOME}" CACHE PATH "")

set(_mpi_bin "/oscar/rt/9.6/25/spack/x86_64_v3/openmpi-4.1.8-iqkfiqkhvkeeixa6xvp2o7nuidh6x6x3/bin")
set(MPI_C_COMPILER "${_mpi_bin}/mpicc" CACHE FILEPATH "")
set(MPI_CXX_COMPILER "${_mpi_bin}/mpicxx" CACHE FILEPATH "")
set(MPI_Fortran_COMPILER "${_mpi_bin}/mpif90" CACHE FILEPATH "")

set(METIS_5_DIR "${TPL_ROOT}/petsc/build" CACHE PATH "")
set(PETSC_DIR "${TPL_ROOT}/petsc" CACHE PATH "")
set(PETSC_ARCH "arch-linux-c-opt" CACHE STRING "")
set(PETSC_BUILD_DIR "${TPL_ROOT}/petsc/build" CACHE PATH "")

set(SHLIB_SUFFIX ".so" CACHE STRING "")
# gfortran runtime of the system gcc 11.5 (used by the OpenMPI wrappers).
set(FORTRAN_RUNTIME_LIBRARIES
    "/usr/lib/gcc/x86_64-redhat-linux/11/libgfortran${SHLIB_SUFFIX}"
    CACHE STRING "")

# CUDA 12.9 toolkit (module cuda/12.9.0-cinr). Target Hopper: nvcc 12.9 stalls
# on some MFEM kernels for Blackwell targets, and sm_90 code runs on Blackwell.
set(CUDAToolkit_ROOT
    "/oscar/rt/9.6/25/spack/x86_64_v3/cuda-12.9.0-cinrl2oeqemd3szbcakkugp2vtk2fh5t"
    CACHE PATH "")
set(CMAKE_CUDA_COMPILER "${CUDAToolkit_ROOT}/bin/nvcc" CACHE FILEPATH "")
set(CMAKE_CUDA_ARCHITECTURES 90 CACHE STRING "")

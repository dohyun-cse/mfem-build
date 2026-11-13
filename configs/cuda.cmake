# Adds CUDA; combine with another layer, e.g. -c full+cuda. The machine
# file should point TPL paths at CUDA-built libraries when
# MFEM_BUILD_VARIANT is cuda.
include_guard(GLOBAL)
mfem_build_require(cuda CMAKE_CUDA_ARCHITECTURES)
set(MFEM_USE_CUDA YES CACHE BOOL "")

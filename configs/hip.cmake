# Adds HIP; combine with another layer, e.g. -c full+hip.
include_guard(GLOBAL)
mfem_build_require(hip HIP_ARCH)
set(MFEM_USE_HIP YES CACHE BOOL "")

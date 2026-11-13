# Adds GSLIB; combine with another layer, e.g. -c full+gslib.
include_guard(GLOBAL)
mfem_build_require(gslib GSLIB_DIR)
set(MFEM_USE_GSLIB YES CACHE BOOL "")

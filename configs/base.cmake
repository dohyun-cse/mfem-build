# MPI + METIS 5.
include_guard(GLOBAL)
mfem_build_require(base METIS_5_DIR)
set(MFEM_USE_METIS_5 YES CACHE BOOL "")
set(METIS_DIR "${METIS_5_DIR}" CACHE PATH "")

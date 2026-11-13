# Environment for dkim-mac, sourced by mfem-build before cmake.
# gfortran (via the PETSc/MUMPS libraries) needs the SDK during configure.
export SDKROOT="${SDKROOT:-$(xcrun --show-sdk-path)}"

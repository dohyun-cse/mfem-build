# Shared by every configuration. Configuration and machine files only set
# cache defaults: the first file to set a variable wins (local.cmake, then
# the machine file, then the layers), so later files never override earlier
# ones.
include_guard(GLOBAL)
set(MFEM_USE_MPI YES CACHE BOOL "")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON CACHE BOOL "")

# mfem_build_require(<layer> <var>...): stop if a variable the layer needs
# is not set by the machine file or local.cmake.
macro(mfem_build_require layer)
  foreach(_var ${ARGN})
    if (NOT DEFINED ${_var} OR "${${_var}}" STREQUAL "")
      message(FATAL_ERROR "mfem-build: layer '${layer}' needs ${_var}; set it "
              "in machines/${MFEM_BUILD_MACHINE}.cmake or local.cmake")
    endif()
  endforeach()
endmacro()

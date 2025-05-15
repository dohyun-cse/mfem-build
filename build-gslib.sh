PETSC_SOURCE_DIR=$HOME/mfem/petsc
PETSC_INSTALL_DIR=$HOME/mfem/petsc/build
PETSC_ARCH="arch-darwin-c-opt"
while getopts ":fg" opt; do
  case ${opt} in
    g )
      PETSC_INSTALL_DIR=$HOME/mfem/petsc/build-debug
      echo "Building in debug mode..."
      ;;
    * )
      echo "Usage: $0 [-g]"
      exit 1
      ;;
  esac
done

make parallel \
  MFEM_USE_PETSC=YES \
  PETSC_DIR=$PETSC_INSTALL_DIR \
  PETSC_ARCH="" \
  HYPRE_DIR=$PETSC_INSTALL_DIR \
  MFEM_USE_METIS_5=YES \
  METIS_DIR=$PETSC_INSTALL_DIR \
  MFEM_USE_GSLIB=YES \
  GSLIB_DIR=$(pwd)/../gslib/build \
  MFEM_USE_HIOP=YES \
  -j8

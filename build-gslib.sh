PETSC_SOURCE_DIR=$HOME/mfem/petsc
PETSC_INSTALL_DIR=$HOME/mfem/petsc/build
TARGET="parallel"
while getopts ":fg" opt; do
  case ${opt} in
    g )
      TARGET="pdebug"
      echo "Building in debug mode..."
      ;;
    * )
      echo "Usage: $0 [-g]"
      exit 1
      ;;
  esac
done

make $TARGET \
  HYPRE_DIR=$PETSC_INSTALL_DIR \
  HYPRE_LIB="-L$PETSC_INSTALL_DIR/lib -lHYPRE -Wl,-rpath,$PETSC_INSTALL_DIR/lib" \
  MFEM_USE_METIS_5=YES \
  METIS_DIR=$PETSC_INSTALL_DIR \
  MFEM_USE_GSLIB=YES \
  GSLIB_DIR=$(pwd)/../gslib/build \
  MFEM_USE_HIOP=YES \
  HIOP_DIR=$(pwd)/../hiop/install \
  -j8

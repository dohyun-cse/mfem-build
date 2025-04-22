force_rebuild=false
BUILD_TYPE="RELEASE"
while getopts ":g" opt; do
  case ${opt} in
    g )
      BUILD_TYPE="DEBUG"
      echo "Building in debug mode..."
      ;;
    * )
      echo "Usage: $0 [-g]"
      exit 1
      ;;
  esac
done

echo "Rebuilding from scratch..."
export PETSC_DIR=$HOME/mfem/petsc-install
export PETSC_ARCH=""
make \
  MFEM_USE_PETSC=YES \
  PETSC_DIR=$PETSC_DIR \
  PETSC_ARCH="" \
  MFEM_USE_MPI=YES \
  HYPRE_DIR=$PETSC_DIR \
  MFEM_USE_METIS_5=YES \
  METIS_DIR=$PETSC_DIR \
  ParMETIS_DIR=$PETSC_DIR \
  ScaLAPACK_DIR=$PETSC_DIR/../petsc/arch-darwin-c-opt/externalpackages/git.scalapack/petsc-build \
  MFEM_USE_MUMPS=YES \
  MUMPS_DIR=$PETSC_DIR \
  MFEM_USE_GSLIB=YES \
  GSLIB_DIR=../gslib/build \
  MFEM_USE_SUITESPARSE=YES \
  SUITESPARSE_DIR=$PETSC_DIR \
  -j8

cat > .clangd <<EOF
CompileFlags:
  CompilationDatabase: build
  Add: [-DMFEM_CONFIG_FILE="${PWD}/build/config/_config.hpp"]
EOF

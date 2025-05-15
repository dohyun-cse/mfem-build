force_rebuild=false
PETSC_SOURCE_DIR=$HOME/mfem/petsc
PETSC_DIR=$HOME/mfem/petsc/build
PETSC_ARCH="arch-darwin-c-opt"
BUILD_TYPE="RELEASE"
BUILD_DIR="./build"

while getopts ":fg" opt; do
  case ${opt} in
    g )
      BUILD_TYPE="DEBUG"
      BUILD_DIR="./build-debug"
      echo "Building in debug mode..."
      ;;
    * )
      echo "Usage: $0 [-g]"
      exit 1
      ;;
  esac
done

rm -rf $BUILD_DIR
cmake \
  -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
  -DMFEM_USE_MPI=YES \
  -DHYPRE_DIR=$PETSC_DIR \
  -DMFEM_USE_PETSC=YES \
  -DPETSC_DIR=$PETSC_DIR \
  -DPETSC_ARCH="" \
  -DMFEM_USE_METIS_5=YES \
  -DMETIS_DIR=$PETSC_DIR \
  -DParMETIS_DIR=$PETSC_DIR \
  -DScaLAPACK_DIR=$PETSC_SOURCE_DIR/$PETSC_ARCH/externalpackages/git.scalapack/petsc-build \
  -DMFEM_USE_MUMPS=YES \
  -DMUMPS_DIR=$PETSC_DIR \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
  -S . -B $BUILD_DIR
cat > .clangd <<EOF
CompileFlags:
  CompilationDatabase: build
  Add: [-DMFEM_CONFIG_FILE="${PWD}/${BUILD_DIR}/config/_config.hpp"]
EOF
cd $BUILD_DIR
make -j8

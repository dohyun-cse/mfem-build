force_rebuild=false
PETSC_SOURCE_DIR=$HOME/mfem/petsc
PETSC_INSTALL_DIR=$HOME/mfem/petsc-install
PETSC_ARCH="arch-darwin-c-opt"
BUILD_TYPE="RELEASE"
BUILD_DIR="./build"
while getopts ":fg" opt; do
  case ${opt} in
    f )
      force_rebuild=true
      ;;
    g )
      BUILD_TYPE="DEBUG"
      BUILD_DIR="./build-debug"
      echo "Building in debug mode..."
      ;;
    * )
      echo "Usage: $0 [-f]"
      exit 1
      ;;
  esac
done

if $force_rebuild; then
  echo "Rebuilding from scratch..."
  rm -rf $BUILD_DIR
  cmake \
    -DCMAKE_BUILD_TYPE=$BUILD_TYPE \
    -DMFEM_USE_MPI=YES \
    -DHYPRE_DIR=$PETSC_INSTALL_DIR \
    -DMFEM_USE_PETSC=YES \
    -DPETSC_DIR=$PETSC_INSTALL_DIR \
    -DPETSC_ARCH="" \
    -DMFEM_USE_METIS_5=YES \
    -DMETIS_DIR=$PETSC_INSTALL_DIR \
    -DParMETIS_DIR=$PETSC_INSTALL_DIR \
    -DScaLAPACK_DIR=$PETSC_SOURCE_DIR/$PETSC_ARCH/externalpackages/git.scalapack/petsc-build \
    -DMFEM_USE_MUMPS=YES \
    -DMUMPS_DIR=$PETSC_INSTALL_DIR \
    -DMFEM_USE_SUITESPARSE=YES \
    -DSuiteSparse_DIR=$PETSC_INSTALL_DIR/include \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -S . -B $BUILD_DIR
fi
cat > .clangd <<EOF
CompileFlags:
  CompilationDatabase: build
  Add: [-DMFEM_CONFIG_FILE="${PWD}/${BUILD_DIR}/config/_config.hpp"]
EOF
cd $BUILD_DIR
make -j8

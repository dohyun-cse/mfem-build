force_rebuild=false

BUILD_TYPE="RELEASE"
BUILD_DIR="./build"

# Set PETSc paths
PETSC_DIR=$HOME/mfem/petsc
PETSC_BUILD_DIR=$HOME/mfem/petsc/build
PETSC_ARCH=arch-darwin-c-opt

while getopts ":g" opt; do
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
  -DMFEM_USE_PETSC=YES \
  -DPETSC_DIR=$PETSC_DIR \
  -DPETSC_ARCH=$PETSC_ARCH \
  -DMFEM_USE_MPI=YES \
  -DHYPRE_DIR=$PETSC_BUILD_DIR \
  -DMFEM_USE_METIS_5=YES \
  -DMETIS_DIR=$PETSC_BUILD_DIR \
  -DParMETIS_DIR=$PETSC_BUILD_DIR \
  -DScaLAPACK_DIR=$PETSC_DIR/$PETSC_ARCH/externalpackages/git.scalapack/petsc-build \
  -DMFEM_USE_SUITESPARSE=YES \
  -DSuiteSparse_DIR=$PETSC_BUILD_DIR \
  -DMFEM_USE_MUMPS=YES \
  -DMUMPS_DIR=$PETSC_BUILD_DIR \
  -DMFEM_USE_HIOP=YES \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
  -S . -B $BUILD_DIR
cd $BUILD_DIR
make -j8
cp ../config/mfem.astylerc ../.astylerc

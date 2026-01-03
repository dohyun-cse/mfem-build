PETSC_DIR=$(pwd)
BUILD_DIR=build
PETSC_ARCH=arch-darwin-c-opt

# RELEASE BUILD
rm -rf $BUILD_DIR
mkdir $BUILD_DIR

rm -rf $PETSC_ARCH

./configure \
  --prefix=$BUILD_DIR \
  --with-debugging=0 \
  --download-hypre \
  --download-mumps \
  --download-scalapack \
  --download-suitesparse \
  --download-openblas \
  --download-metis \
  --download-parmetis \
  FOPTFLAGS="-O3" \
  COPTFLAGS="-O3 -march=native -mtune=native" \
  CXXOPTFLAGS="-O3 -march=native -mtune=native"

make PETSC_DIR=$PETSC_DIR PETSC_ARCH=$PETSC_ARCH all -j8
make PETSC_DIR=$PETSC_DIR PETSC_ARCH=$PETSC_ARCH install -j8
make PETSC_DIR=$PETSC_DIR PETSC_ARCH=$PETSC_ARCH check

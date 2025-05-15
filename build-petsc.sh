PETSC_SOURCE_DIR=$(pwd)
PETSC_RELEASE_DIR=$PETSC_SOURCE_DIR/build
PETSC_DEBUG_DIR=$PETSC_SOURCE_DIR/build-debug

# RELEASE BUILD
rm -r $PETSC_SOURCE_DIR/arch-*-opt
rm -r $PETSC_RELEASE_DIR
mkdir $PETSC_RELEASE_DIR
./configure \
  --prefix=$PETSC_RELEASE_DIR \
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

make all
make PETSC_DIR=$PETSC_SOURCE_DIR PETSC_ARCH=arch-darwin-c-opt install

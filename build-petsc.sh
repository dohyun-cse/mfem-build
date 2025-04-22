PETSC_SOURCE_DIR=$HOME/mfem/petsc
PETSC_INSTALL_DIR=$HOME/mfem/petsc-install
rm -r $PETSC_INSTALL_DIR
rm -r $PETSC_SOURCE_DIR/arch-*

mkdir $PETSC_INSTALL_DIR
./configure \
  --prefix=$PETSC_INSTALL_DIR \
  --with-debugging=0 \
  --download-hypre \
  --download-mumps \
  --download-scalapack \
  --download-suitesparse \
  --download-openblas \
  --download-metis \
  --download-parmetis \
  COPTFLAGS="-O3 -march=native -mtune=native" \
  CXXOPTFLAGS="-O3 -march=native -mtune=native"

make all
make install

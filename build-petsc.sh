unset PETSC_DIR
unset PETSC_ARCH
rm -r $HOME/mfem/petsc-install
mkdir $HOME/mfem/petsc-install
cd $HOME/mfem/petsc
./configure \
  --prefix=$HOME/mfem/petsc-install \
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
export PETSC_DIR=$HOME/mfem/petsc-install
export PETSC_ARCH=""

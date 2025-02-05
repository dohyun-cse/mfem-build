force_rebuild=false
BUILD_TYPE="RELEASE"
while getopts ":fg" opt; do
  case ${opt} in
    f )
      force_rebuild=true
      ;;
    g )
      BUILD_TYPE="DEBUG"
      ;;
    * )
      echo "Usage: $0 [-f]"
      exit 1
      ;;
  esac
done

if $force_rebuild; then
  echo "Rebuilding from scratch..."
  rm -rf build
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
    -DScaLAPACK_DIR=$PETSC_DIR/../petsc/arch-darwin-c-opt/externalpackages/git.scalapack/petsc-build \
    -DMFEM_USE_MUMPS=YES \
    -DMUMPS_DIR=$PETSC_DIR \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
    -S . -B ./build
fi
ln -sf build/compile_commands.json .
cd build
make -j8

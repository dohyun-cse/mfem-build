force_rebuild=false

BUILD_TYPE="RELEASE"
BUILD_DIR="./build"

METIS_DIR="../metis-5.1.0"

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
  -DMFEM_USE_MPI=YES \
  -DMFEM_USE_METIS_5=YES \
  -DMETIS_DIR=$METIS_DIR \
  -DCMAKE_EXPORT_COMPILE_COMMANDS=1 \
  -S . -B $BUILD_DIR
cd $BUILD_DIR
make -j8
cp ../config/mfem.astylerc ../.astylerc

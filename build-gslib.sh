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
  mkdir build
  cmake -DMFEM_DEBUG=YES -DMFEM_USE_MPI=YES -DMFEM_USE_METIS_5=YES -DMETIS_DIR=../metis-5.1.0 -DMFEM_USE_GSLIB=YES -DGSLIB_DIR=../gslib/build -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build
  rm compile_commands.json
  ln -s build/compile_commands.json .
fi

cd build
make -j8

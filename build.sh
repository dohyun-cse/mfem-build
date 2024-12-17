force_rebuild=false
while getopts "f" opt; do
  case ${opt} in
    f )
      force_rebuild=true
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
  cmake -DMFEM_USE_MPI=YES -DMFEM_USE_METIS_5=YES -DMETIS_DIR=../metis -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B build
fi
rm compile_commands.json
ln -s build/compile_commands.json .
cd build
cmake --build . --target all -j8

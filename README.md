# mfem-build

Configure and build any MFEM source tree from shared configuration files.

```bash
cd ~/mfem/mfem-mv-default
~/mfem/mfem-build/mfem-build              # Release, layers "full", in build/
~/mfem/mfem-build/mfem-build -g           # Debug, in build-debug/
~/mfem/mfem-build/mfem-build -c full+cuda # in build-full+cuda/
```

A build directory is configured once, when it is created. Later runs only
build, so rebuilds are incremental. To change the configuration of an
existing directory, use `--clean`. `mfem-build -h` lists all options.

## Layout

- `configs/`: feature layers (what MFEM enables), shared by everyone.
  Combine them with `+`. `full` includes `nopetsc` and `petsc-tpl`.
  `gslib`, `cuda` and `hip` are added on top, e.g. `full+cuda`.
- `machines/<machine>.cmake`: where things are on one machine (TPL paths,
  MPI wrappers, CUDA toolkit and architecture), plus an optional
  `<machine>.sh` for the environment (`module load`, `SDKROOT`).
- `machines/hosts`: maps hostname patterns to machine names.
- `local.cmake` (git-ignored, optional): personal overrides.

The first file to set a variable wins: `local.cmake`, then the machine file,
then the layers. A layer stops at configure with the name of any variable it
needs that the machine file doesn't set.

## Adding a machine

1. Copy `machines/example-cluster.cmake` (and `.sh`) to `machines/<name>.cmake`.
2. Set the paths. `MFEM_BUILD_VARIANT` (`cpu`, `cuda` or `hip`, from the
   layers) can select TPLs built for each variant.
3. If the hostname doesn't reduce to `<name>` (lower case, trailing digits
   removed), add a line to `machines/hosts`, or pass `-m <name>`, or set
   `MFEM_BUILD_MACHINE`. On LC systems, `$LCSCHEDCLUSTER` is used.

## Stale paths

Paths cached under `MFEM_BUILD_WATCH_PREFIXES` (set by the machine file,
e.g. `/opt/homebrew/Cellar`) are checked before every build. If one has
disappeared, e.g. after a package upgrade, the script stops and asks for
`--clean`.

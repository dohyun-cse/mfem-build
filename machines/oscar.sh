# Environment for oscar, sourced by mfem-build before cmake. Use the system
# gcc 11.5 through the OpenMPI wrappers; do not load a spack gcc.
module load openmpi/4.1.8-iqkf cuda/12.9.0-cinr cmake/3.31.8-tm7r
export OMPI_MCA_btl='^openib'

module load ESMF/7.1.0r-intel-2018a
module load NCO/4.7.2-intel-2018a
export ESMFBIN_PATH=/cluster/software/ESMF/7.1.0r-intel-2018a/bin
./gen_cesm_maps.sh --fileatm /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc --fileocn /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_3minx3min_MODISv2-ocn_c190503.nc --nameocn 3minx3min_MODISv2-ocn --nameatm Fennoscandia0.05x0.1_nomask --typeocn global --typeatm regional -v --serial

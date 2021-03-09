# Script to run gen_cesm_maps a second time to generate mapping between the
# Fennoscandia0.05x0.1 and the glacier gland4 and river r05 grids.
module load ESMF/7.1.0r-intel-2018a
module load NCO/4.7.2-intel-2018a
export ESMFBIN_PATH=/cluster/software/ESMF/7.1.0r-intel-2018a/bin
./gen_cesm_maps.sh \
    --fileatm /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc \
    --nameatm Fennoscandia0.05x0.1_nomask \
    --filertm /cluster/projects/nn9188k/cesm2.0/inputdata/share/scripgrids/r05_nomask_070925.nc --namertm 0.5x0.5_nomask \
    --fileglc /cluster/projects/nn9188k/cesm2.0/inputdata/glc/cism/griddata/SCRIPgrid_greenland_4km_epsg3413_c170414.nc --nameglc gland4 \
    -v --serial 

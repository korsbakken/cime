# Script to run gen_cesm_maps a second time to generate mapping between the
# Fennoscandia0.05x0.1 and the glacier gland4 and river r05 grids.
#
# NB! The map file between lnd and glc (Fennoscandia0.05x0.1 and gland4)
# fails tests. It may be that there is no real overlap between the two grids
# (gland4 seems to only cover Greenland, but does extend to 13E and 58S, so in
# principle there should be overlap even though it is not very relevant for
# the model).

module load ESMF/7.1.0r-intel-2018a
module load NCO/4.7.2-intel-2018a
export ESMFBIN_PATH=/cluster/software/ESMF/7.1.0r-intel-2018a/bin

# First create conservative lnd to rtm mapping
./create_ESMF_map.sh \
    --filesrc /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc \
    --namesrc Fennoscandia0.05x0.1_nomask \
    --filedst /cluster/projects/nn9188k/cesm2.0/inputdata/share/scripgrids/r05_nomask_070925.nc --namedst 0.5x0.5_nomask \
    --maptype aave \
    --typesrc regional --typedst regional \
    -v --serial --large_file --machine fram
#    --fileglc /cluster/projects/nn9188k/cesm2.0/inputdata/glc/cism/griddata/SCRIPgrid_greenland_4km_epsg3413_c170414.nc --nameglc gland4 \

# Then create conservative rtm to lnd mapping
./create_ESMF_map.sh \
    --filesrc /cluster/projects/nn9188k/cesm2.0/inputdata/share/scripgrids/r05_nomask_070925.nc --namesrc 0.5x0.5_nomask \
    --filedst /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc \
    --namedst Fennoscandia0.05x0.1_nomask \
    --maptype aave \
    --typesrc regional --typedst regional \
    -v --serial --large_file --machine fram

# Then create conservative glc to lnd mapping
./create_ESMF_map.sh \
    --filesrc /cluster/projects/nn9188k/cesm2.0/inputdata/glc/cism/griddata/SCRIPgrid_greenland_4km_epsg3413_c170414.nc --namesrc gland4_nomask \
    --filedst /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc \
    --namedst Fennoscandia0.05x0.1_nomask \
    --maptype aave \
    --typesrc regional --typedst regional \
    -v --serial --large_file --machine fram

# Then create conservative lnd to glc mapping
./create_ESMF_map.sh \
    --filesrc /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc \
    --namesrc Fennoscandia0.05x0.1_nomask \
    --filedst /cluster/projects/nn9188k/cesm2.0/inputdata/glc/cism/griddata/SCRIPgrid_greenland_4km_epsg3413_c170414.nc --namedst gland4_nomask \
    --maptype aave \
    --typesrc regional --typedst regional \
    -v --serial --large_file --machine fram

# Then create bilinear lnd to glc mapping
./create_ESMF_map.sh \
    --filesrc /cluster/projects/nn9188k/cesm2.1.2/inputdata/cicero_mods/lnd/clm2/mappingdata/grids/SCRIPgrid_Fennoscandia0.05x0.1_nomask_c200217.nc \
    --namesrc Fennoscandia0.05x0.1_nomask \
    --filedst /cluster/projects/nn9188k/cesm2.0/inputdata/glc/cism/griddata/SCRIPgrid_greenland_4km_epsg3413_c170414.nc --namedst gland4_nomask \
    --maptype blin \
    --typesrc regional --typedst regional \
    -v --serial --large_file --machine fram

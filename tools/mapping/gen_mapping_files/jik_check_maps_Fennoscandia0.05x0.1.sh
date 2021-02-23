# The following command was attempted used by gen_cesm_maps.sh /
# create_ESMF_map.sh to check the created mapping files. It failed because the
# date stamp on the latter couple of files was off by one (the creation process
# spanned midnight, causing the creation date in the file name of some files to
# be they day after the others, but the script assumed that all creation dates
# should be the same. This command was used after renaming the files to have
# the creation date of the day that the creation process for all the mapping
# files was started.)
#
# All tests passed when running it on 2021-02-23, on maps generated during the
# night of 2021-02-22/2021-02-23.

./../check_maps/check_map.sh -v \
    map_3minx3min_MODISv2-ocn_TO_Fennoscandia0.05x0.1_nomask_aave.210222.nc \
    map_3minx3min_MODISv2-ocn_TO_Fennoscandia0.05x0.1_nomask_blin.210222.nc \
    map_Fennoscandia0.05x0.1_nomask_TO_3minx3min_MODISv2-ocn_aave.210222.nc \
    map_Fennoscandia0.05x0.1_nomask_TO_3minx3min_MODISv2-ocn_blin.210222.nc \
    map_Fennoscandia0.05x0.1_nomask_TO_3minx3min_MODISv2-ocn_patc.210222.nc

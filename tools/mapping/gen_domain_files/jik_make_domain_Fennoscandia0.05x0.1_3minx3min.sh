#!/bin/bash
# Comamands to build domain file for land (and ocean) for use with CLM/DATM
# compsets running on the regional high-resolution Fennoscandia0.05x0.1 grid.

source ./jik_set_env_for_gen_domain_build.sh
./gen_domain -m /cluster/projects/nn9188k/cesm2.0/inputdata/cicero_mods/lnd/clm2/mappingdata/maps/Fennoscandia0.05x0.1/map_3minx3min_MODISv2-ocn_TO_Fennoscandia0.05x0.1_nomask_aave.210223.nc \
    -o 3minx3min -l Fennoscandia0.05x0.1 \
    -c 'Generated using Fennoscandia0.05x0.1_nomask grid for atmosphere/land, and 3minx3min with the complement of the MODISv2 land mask for the ocean.'

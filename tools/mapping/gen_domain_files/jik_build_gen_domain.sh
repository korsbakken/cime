#!/bin/bash
# This script builds gen_domain on fram. The (non-)standard setup from UCAR
# does not work on fram.

source ./jik_set_env_for_gen_domain_build.sh
cd src
gmake

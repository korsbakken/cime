# Script used to build ESMF_RegridWeightGenCheck.sh on fram. The key is to load
# an ESMF module, and set ESMFMKFILE to point to the esmf.mk file included in
# that module. Not sure whether the NCO module is needed, but it was loaded
# when I ran the script the first time, so including it just in case.

module load ESMF/7.1.0r-intel-2018a
module load NCO/4.7.2-intel-2018a
ESMFMKFILE=$(find $(dirname $(dirname $(which ESMF_RegridWeightGen))) -name 'esmf.mk' -print) gmake

"""Script to flip the mask of the 3x3 minute MODISv2 grid to generate an
"ocean" mask with the same resolution and (complementary) mask as the PFT
input raw data set. This is then used to make a land-"ocean" mapping file,
which in term is used to generate the domain file, which will then have the
correct land fraction. None of this has anything to do with modelling the
ocean (which should just be a stub in the compsets used with the
Fennoscandia0.05x0.1 grid). It is simply a trick to make the CLM/CESM tools
generate a domain file with the right land mask and land fractions without
having to produce our own land fractions or land mask.

NB! This file is hard-linked both to the inputdata tree (under cicero_mods) and in the cime/tools folder under cesm2.1.2. Take care before editing or moving.
"""

import datetime as dt
from pathlib import Path

import xarray as xr
from dask.diagnostics import ProgressBar
import numpy as np

pbar = ProgressBar()
pbar.register()

in_scrip_file = 'SCRIPgrid_3minx3min_MODISv2_c190503.nc'
out_scrip_file = 'SCRIPgrid_3minx3min_MODISv2-ocn_c190503.nc'

print(f'Opening SCRIP file {in_scrip_file}...')
inds: xr.Dataset = xr.open_dataset(in_scrip_file)
nc_format: str = inds._file_obj.format
print(f'Format is {nc_format}.')

mask_field_name = 'grid_imask'
print(f'File opened, now inverting land mask ({mask_field_name})...')
mask_field_type: np.dtype = inds[mask_field_name].dtype
print(f'Grid mask has type {str(mask_field_type)}.')
inds[mask_field_name] = (~(inds[mask_field_name].astype(bool))).astype(mask_field_type)

print(f'Inverted land mask, now amending global attributes...')
inds.attrs['history'] += f'\n{str(dt.datetime.utcnow())}: Inverted land mask to create ocean mask.'
inds.attrs['Comment'] += f'\nThe original land file was {Path(in_scrip_file).absolute()}.'

print(f'Now writing to output file {out_scrip_file} in {nc_format} format...')
inds.to_netcdf(out_scrip_file, format=nc_format)
print(f'Output file was written!')

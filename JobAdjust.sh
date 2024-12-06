#!/bin/bash
export nstep=1
export rundir=/p/scratch/cjibg31/jibg3105/CESMDataRoot/CaseOutputs/CLM5EU3_BGC_west_Chain/run/
export year=`ls -lrth ${rundir}*.clm2.r.*-01-01-00000.nc | tail -1 | awk '{print substr($9,111,4)}'`
echo $year
printf -v pyear "%04d" $((year-nstep))
echo $pyear
export yeardir=/p/scratch/cjibg31/jibg3105/CESMDataRoot/InputData/lnd/clm2/initdata_map/CLM5EU3_BGC_west/${year}-01-01-00000
mkdir -p $yeardir
cp ${rundir}*.r.${year}-01-01-00000.nc $yeardir
./xmlchange RUN_STARTDATE=${year}-01-01
sed "/finidat/ s/$pyear/$year/g" user_nl_clm

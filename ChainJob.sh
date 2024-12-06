#!/bin/bash -x
# submit a chain of jobs with dependency
# number of jobs to submit

NO_OF_JOBS=7
# define jobscript
JOB_SCRIPT="case.submit"
echo "${JOB_SCRIPT}"
JOBID=$(./${JOB_SCRIPT} --mail-user=c.poppe@fz-juelich.de 2>&1 | awk '/Submitted job id is/{print $(NF);exit;}')
echo $JOBID
I=1
while [ ${I} -le ${NO_OF_JOBS} ]; do
  echo "./${JOB_SCRIPT} --prereq ${JOBID} --mail-user=c.poppe@fz-juelich.de"
  JOBID=$(./${JOB_SCRIPT} --prereq ${JOBID} --mail-user=c.poppe@fz-juelich.de 2>&1 | awk '/Submitted job id is/{print $(NF);exit;}')
  echo $JOBID
  let I=${I}+1
done

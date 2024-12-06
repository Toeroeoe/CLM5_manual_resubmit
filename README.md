# Workflow for manual resubmit CLM5 / eCLM
## Step by step guide:
1. Copy the `JobAdjust.sh` and `JobSubmit.sh` to your CLM case directory
2. Set the `JobAdjust.sh` as post run script. In CLM5 case directory: `./xmlchange POSTRUN_SCRIPT=JobAdjust.sh`
3. Adjust the `n_step` (years per run), `rundir` and possibly the `year` parameter in `JobAdjust.sh`
4. Set the number of jobs you want to submit in `ChainJob.sh`
5. Execute `Chainjob.sh` and you're done!

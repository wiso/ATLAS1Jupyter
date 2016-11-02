# Instructions

### From Cluster Node
Run `notebook.sh` or submit a batchjob on the port of your choice `qsub -v ssh_port=4321 -X notebook.sh`

### From Local Computer
Listen to port `ssh -N -f -L 4321:localhost:4321 atlas1.hep.yale.edu`

Open up browser and view notebook at `localhost:4321`

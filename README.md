## Instructions
This is a simple script to run a jupyter notebook remotely, tunneling through atlas1. 

The example below uses the port 4321, please be sure to select unique port to avoid conflicts. 

### From Cluster Node (for example atlas1.hep.yale.edu)
Run `notebook.sh 4321` or submit a batchjob on the port of your choice `qsub -v ssh_port=4321 -X notebook.pbs`

### From Local Computer
Listen to port `ssh -N -f -L 4321:localhost:4321 atlas1.hep.yale.edu`

If you are using lxplus as cluster node you have to specify the name of the machine, e.g. lxplus050.cern.ch

Open up browser and view notebook at `localhost:4321`

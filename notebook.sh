# Script to open up a jupyter notebook tunneled through atlas1 
#  --> Please use another port to avoid complications

if [ -z "$ssh_port" ]; then
  ssh_port=55577
  echo "PORT NOT SET: Using port $ssh_port"
fi

# load conda environment 
module load Langs/Python/3.5-anaconda

# setup tunnel 
ssh -f -o ExitOnForwardFailure=yes atlas1.hep.yale.edu -R ${ssh_port}:localhost:${ssh_port} sleep 30

# launch notebook
jupyter notebook --no-browser --port=${ssh_port}

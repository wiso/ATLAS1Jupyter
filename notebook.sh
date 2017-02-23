# Script to open up a jupyter notebook tunneled through atlas1 
#  --> Please use another port to avoid complications

if [ ! -z "$1" ]; then
  ssh_port=$1
  echo "Setting port to $ssh_port"
fi

if [ -z "$ssh_port" ]; then
  ssh_port=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`
  echo "PORT NOT SET: Using port $ssh_port"
fi

host_name=`hostname -f`

echo "Tunneling through port $ssh_port from $host_name"

# setup tunnel
ssh -f -o ExitOnForwardFailure=yes ${host_name} -R ${ssh_port}:localhost:${ssh_port} sleep 30

echo -e "\nRun this command on your client:"
echo -e "\n  ssh -N -f -L $ssh_port:localhost:$ssh_port $host_name"

if [ -z `hostname -d` ]; then
    echo "domain is missing from the hostname $host_name, you have to add it"
fi

# launch notebook
jupyter notebook --no-browser --port=${ssh_port} --ip 127.0.0.1


unset ssh_port

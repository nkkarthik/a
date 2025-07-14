# find docker group and add container user to that group
SOCK=/var/run/docker.sock
if [ -S "$SOCK" ]; then
    GID=$(stat -c '%g' $SOCK)
    groupadd -g "$GID" dockerhost || true
    usermod -aG dockerhost devuser
fi

PS1='\w: '

PATH=$HOME/bin:$PATH
PATH=$HOME/go/bin:$PATH

alias v=nvim

# start
export SHELL=fish
exec gosu knannuru /home/.openvscode-server/bin/openvscode-server --port 30001 --connection-secret=/home/knannuru/.openvscode-server-token

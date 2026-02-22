#!/bin/bash

wandix() {
    CONFIG_HOME="$HOME/.wandix"
    PLAYGROUND_HOME="$HOME/playground"

    # Check Home directory & Configuration directory does exist
    if [[ ! -d "$PLAYGROUND_HOME" && ! -d "$CONFIG_HOME" ]]; then
        echo "wandix is not initialized yet, wandix-init"
    fi

    if [ "$1" = "create" ];then
        if [ "$2" = "docker" ];then
            mkdir $PLAYGROUND_HOME/docker_$3
            cp -r /usr/share/wandix/templates/docker/* $PLAYGROUND_HOME/docker_$3/
            cd $PLAYGROUND_HOME/docker_$3
        fi

        if [ "$2" = "bash" ];then
            mkdir $PLAYGROUND_HOME/bash_$3
            cd $PLAYGROUND_HOME/bash_$3
        fi

        if [ "$2" = "python" ];then
            mkdir $PLAYGROUND_HOME/python_$3
            cd $PLAYGROUND_HOME/python_$3
            touch main.py
        fi

        if [ "$2" = "go" ];then
            mkdir $PLAYGROUND_HOME/go_$3
            cd $PLAYGROUND_HOME/go_$3
            touch main.go
        fi
    fi

    if [ -z "$1" ]; then
        echo "Usage: wandix create <template> <project_name>"
        echo -e "Templates: \n  python\n  docker\n  bash\n go"
        return 1
    fi
}


bu() {
    if [ -z "$1" ]; then
        echo "Usage: bu <filename>"
        return 1
    fi

    cp "$1" "$1.backup-$(date +"%Y-%m-%d_%H-%M-%S")"
    echo "Backup created: $1.backup-$(date +"%Y-%m-%d_%H-%M-%S")"
}


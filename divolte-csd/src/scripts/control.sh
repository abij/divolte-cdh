#!/bin/bash

# Time marker for both stderr and stdout
date 1>&2

CMD=$1
shift 2

function log {
  timestamp=$(date)
  echo "$timestamp: $1"       #stdout
  echo "$timestamp: $1" 1>&2; #stderr
}

export HADOOP_HOME=${HADOOP_HOME:-$CDH_HADOOP_HOME}
export HADOOP_CONF_DIR=$CONF_DIR/hadoop-conf
export DIVOLTE_JAVA_OPTS="$DIVOLTE_JAVA_OPTS"

ARGS=()
case $CMD in

  (start_collector)
    log "Starting Divolte collector"
    # no additional arguments
    ;;

  (*)
    log "Don't understand [$CMD]"
    ;;

esac
ARGS+=($ADDITIONAL_ARGS)

cmd="$DIVOLTE_HOME/bin/divolte-collector ${ARGS[@]}"
echo "Running [$cmd]"
exec $cmd

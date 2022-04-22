#!/bin/bash

build() {
  ${CONT_CMD} build -t inventory . 

}

find_container_cmd() {
if [[ -n $(which docker ) ]]; then
  CONT_CMD=docker
  echo "$CONT_CMD"
  build

elif [[ -n $(which podman ) ]]; then
  CONT_CMD=podman
  echo $CONT_CMD
  build
else
  echo "Container command${CONT_CMD} not found"
  exit 1
fi
}

find_container_cmd
[[ ${1} = 'run' ]] && ${CONT_CMD} run -it --rm inventory

# vim: ts=2 sw=2 expandtab

#!/bin/bash

check_dependency() {
  local DEPENDENCY="${1}"
  command -v "${DEPENDENCY}" >/dev/null 2>&1 || err "${DEPENDENCY} is required but not installed.  Aborting."
}

err() {
  echo -e "[ERR] ${1}"
  exit 1
}

log() {
  echo -e "[LOG] ${1}"
}

main () {
  check_dependency docker

  VERSION=${VERSION-'latest'}
  docker build --rm -t "microdc/auto-jenkins:${VERSION}" .
  docker tag "microdc/auto-jenkins:${VERSION}" "microdc/auto-jenkins:latest"
}

main

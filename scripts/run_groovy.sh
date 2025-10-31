#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <groovy-file> [args...]" >&2
  exit 1
fi
CP_COMPONENTS=(
  "$ROOT_DIR/libs/cpi-mock-msg.jar"
  "$ROOT_DIR/libs/groovy-all-2.4.21.jar"
  "$ROOT_DIR/libs/camel-api-3.14.7.jar"
  "$ROOT_DIR/libs/camel-base-3.14.7.jar"
  "$ROOT_DIR/libs/camel-base-engine-3.14.7.jar"
  "$ROOT_DIR/libs/camel-core-engine-3.14.7.jar"
  "$ROOT_DIR/libs/camel-core-languages-3.14.7.jar"
  "$ROOT_DIR/libs/camel-core-model-3.14.7.jar"
  "$ROOT_DIR/libs/camel-support-3.14.7.jar"
  "$ROOT_DIR/libs/camel-util-3.14.7.jar"
  "$ROOT_DIR/libs/slf4j-api-1.7.36.jar"
  "$ROOT_DIR/libs/slf4j-simple-1.7.36.jar"
  "$ROOT_DIR/src/main/resources"
  "$ROOT_DIR/src/test"
)
CLASSPATH=$(IFS=:; echo "${CP_COMPONENTS[*]}")
java -cp "$CLASSPATH" groovy.ui.GroovyMain "$@"

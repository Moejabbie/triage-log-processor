#!/bin/bash

# System Log Triage & Assignment Tool
# Uses grep for filtering and sed for role assignment

LOG_FILE="$1"

if [[ -z "$LOG_FILE" || ! -f "$LOG_FILE" ]]; then
  echo "Usage: ./triage-log-processor.sh <logfile>"
  exit 1
fi

grep -Ei 'info|debug|error|failure|warn' "$LOG_FILE" | sed -E \
  -e 's/info/INFO-spock/gi' \
  -e 's/debug/DEBUG-kirk/gi' \
  -e 's/error/ERROR-mccoy/gi' \
  -e 's/failure/FAILURE-scotty/gi' \
  -e 's/warn/WARN-uhura/gi'


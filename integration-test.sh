#!/bin/bash
set -e

FIRST=$1
SECOND=$2
EXPECTED=$3
VERSION=${4:-latest}
IMAGE="ci_cd_v1"
DIFF=$(docker run ${IMAGE}:${VERSION} ${FIRST} ${SECOND})

if [[ "${DIFF}" == "${EXPECTED}" ]]; then
    echo "Integration test passed"
else
    echo "[ERROR] ${FIRST} + ${SECOND} returned ${DIFF}, not ${EXPECTED}" >&2
    exit 1
fi


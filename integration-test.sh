#!/bin/bash
set -e

EXPECTED=5
VERSION=${1:-latest}
IMAGE="ci_cd_v1"
DIFF=$(docker run ${IMAGE}:${VERSION} 8 3)

if [[ "${DIFF}" == "${EXPECTED}" ]]; then
    echo "Integration test passed"
else
    echo "[ERROR] 8 - 3 returned ${DIFF}, not ${EXPECTED}" >&2
    exit 1
fi


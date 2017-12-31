#!/bin/bash

SRC=${1}
DEST=${2}
EXIT=0

if [ -z "${SRC}" ]; then
	echo "Source path required. (Default: /completed/*)"
	EXIT=1
fi

if [ -z "${DEST}" ]; then
	echo "Destination path required. (Default: /pool/tranfer/)"
	EXIT=1
fi

if [ ${EXIT} -eq 1 ]; then
	echo "rsync -vP -e ssh mbeisser@3-168mars.pulsedmedia.com:/home/mbeisser/<SRC> <DEST>"
	exit -1
fi

CMD="rsync -vPr -e ssh mbeisser@3-168mars.pulsedmedia.com:/home/mbeisser/${SRC} ${DEST}"
echo "${CMD}"
exec ${CMD}

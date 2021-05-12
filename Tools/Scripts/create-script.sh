#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail


if [ "$#" -ne 1 ]; then
	echo "Usage: ${0##*/} <script-name>"
	exit 1
fi

SCRIPT="$1"

if [ -f "${SCRIPT}" ]; then
	echo "${SCRIPT} already exists. Exiting"
fi

cat > "${SCRIPT}" << EOF
#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail
EOF

chmod +x "${SCRIPT}"

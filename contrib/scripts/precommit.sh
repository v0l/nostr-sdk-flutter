#!/bin/bash

set -exuo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

"${DIR}/generate.sh"        # Generate dart output
"${DIR}/check-fmt.sh"       # Format the code
"${DIR}/check-crate.sh"     # Check crate
"${DIR}/check-flutter.sh"   # Check flutter

#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RUST_DIR="${SCRIPT_DIR}/../../rust"

cd "${RUST_DIR}"

cargo check
cargo test
cargo clippy -- -D warnings

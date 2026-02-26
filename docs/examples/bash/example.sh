#!/usr/bin/env bash

set -euo pipefail

greet() {
	local name="$1"
	printf 'Hello, %s\n' "$name"
}

main() {
	local user="${1:-dev}"
	greet "$user"
}

main "$@"

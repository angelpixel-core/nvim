#!/usr/bin/env bash

set -u

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPORT_FILE="$ROOT_DIR/bootstrap-report.txt"

timestamp() {
	date "+%Y-%m-%d %H:%M:%S"
}

write_report() {
	printf "%s\n" "$1" | tee -a "$REPORT_FILE"
}

run_in_dir() {
	local dir="$1"
	local label="$2"
	local cmd="$3"

	write_report "- [$label] $cmd"
	(cd "$dir" && eval "$cmd") >>"$REPORT_FILE" 2>&1
	if [ $? -eq 0 ]; then
		write_report "  -> OK"
		return 0
	fi

	write_report "  -> FAILED"
	return 1
}

check_local_bin() {
	local dir="$1"
	local bin="$2"
	local path="$dir/node_modules/.bin/$bin"

	if [ -x "$path" ]; then
		write_report "  [BIN OK] $path"
	else
		write_report "  [BIN MISSING] $path"
	fi
}

bootstrap_node_env() {
	local rel_dir="$1"
	local dir="$ROOT_DIR/$rel_dir"

	if [ ! -f "$dir/package.json" ]; then
		write_report "- [$rel_dir] skipped (no package.json)"
		return
	fi

	if command -v pnpm >/dev/null 2>&1; then
		run_in_dir "$dir" "$rel_dir" "pnpm install"
	elif command -v corepack >/dev/null 2>&1; then
		run_in_dir "$dir" "$rel_dir" "corepack enable && corepack pnpm install"
	elif command -v npm >/dev/null 2>&1; then
		run_in_dir "$dir" "$rel_dir" "npm install"
	else
		write_report "- [$rel_dir] FAILED (pnpm/corepack/npm unavailable)"
	fi
}

check_node_bins() {
	local rel_dir="$1"
	local dir="$ROOT_DIR/$rel_dir"

	case "$rel_dir" in
	"typescript")
		check_local_bin "$dir" "typescript-language-server"
		check_local_bin "$dir" "pyright-langserver"
		;;
	"html")
		check_local_bin "$dir" "vscode-html-language-server"
		check_local_bin "$dir" "emmet-ls"
		check_local_bin "$dir" "tailwindcss-language-server"
		;;
	"css")
		check_local_bin "$dir" "vscode-css-language-server"
		check_local_bin "$dir" "emmet-ls"
		;;
	"json")
		check_local_bin "$dir" "vscode-json-language-server"
		;;
	"yaml")
		check_local_bin "$dir" "yaml-language-server"
		;;
	"graphql")
		check_local_bin "$dir" "graphql-lsp"
		;;
	"svelte")
		check_local_bin "$dir" "svelteserver"
		check_local_bin "$dir" "tailwindcss-language-server"
		;;
	"bash")
		check_local_bin "$dir" "bash-language-server"
		;;
	"docker")
		check_local_bin "$dir" "docker-langserver"
		;;
	"python")
		check_local_bin "$dir" "pyright-langserver"
		;;
	esac
}

bootstrap_ruby_env() {
	local dir="$ROOT_DIR/ruby"

	if [ ! -f "$dir/Gemfile" ]; then
		write_report "- [ruby] skipped (no Gemfile)"
		return
	fi

	if command -v bundle >/dev/null 2>&1; then
		run_in_dir "$dir" "ruby" "bundle install"
		run_in_dir "$dir" "ruby" "bundle exec ruby-lsp --version"
	else
		write_report "- [ruby] FAILED (bundler unavailable)"
	fi
}

check_standalone_bins() {
	local bin
	for bin in "lua-language-server" "marksman"; do
		if command -v "$bin" >/dev/null 2>&1; then
			write_report "  [BIN OK] $(command -v "$bin")"
		else
			write_report "  [BIN MISSING] $bin"
		fi
	done
}

main() {
	: >"$REPORT_FILE"
	write_report "# LSP bootstrap report"
	write_report "Generated: $(timestamp)"
	write_report ""

	write_report "## Node-based environments"
	bootstrap_node_env "typescript"
	bootstrap_node_env "html"
	bootstrap_node_env "css"
	bootstrap_node_env "json"
	bootstrap_node_env "yaml"
	bootstrap_node_env "graphql"
	bootstrap_node_env "svelte"
	bootstrap_node_env "bash"
	bootstrap_node_env "docker"
	bootstrap_node_env "python"
	write_report ""

	write_report "## Ruby environment"
	bootstrap_ruby_env
	write_report ""

	write_report "## Binary checks"
	check_node_bins "typescript"
	check_node_bins "html"
	check_node_bins "css"
	check_node_bins "json"
	check_node_bins "yaml"
	check_node_bins "graphql"
	check_node_bins "svelte"
	check_node_bins "bash"
	check_node_bins "docker"
	check_node_bins "python"
	check_standalone_bins
	write_report ""

	write_report "Done. Report saved to: $REPORT_FILE"
}

main "$@"

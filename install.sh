#!/bin/bash

PROG="$0"
USER_EXECUTABLES_DIR="$HOME/.local/bin"
VERSION=1.0.0

error() {
	local message="$@"
	echo "$PROG: error: $message" >&2
	echo "$PROG: failure"
	exit 1
}

info() {
	local message="$@"
	echo "$PROG: $message" >&2
}

src='tsv2table.sh'
dst="$USER_EXECUTABLES_DIR/tsv2table"
cp "$src" "$dst" && info "copied '$src' to '$dst'" \
                 || error "failed to copy '$src' to '$dst'"
info success

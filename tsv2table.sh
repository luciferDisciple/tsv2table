#!/bin/bash

prog=${0##*/}
ERR_NO_INPUT_FILE_ARG=1
ERR_INPUT_FILE_DOESNT_EXIST=2

usage () {
	echo "usage: $prog tsv_file" >&2
}

err_msg () {
	local message="$1"
	echo "[$prog] $message" >&2
}

if [[ $# -eq 0 ]]; then
	err_msg 'No input file given'
	usage
	exit $ERR_NO_INPUT_FILE_ARG
fi

tsv_file=$1

if [[ ! -e "$tsv_file" ]]; then
	err_msg "File '$tsv_file' doesn't exist"
	exit $ERR_INPUT_FILE_DOESNT_EXIST
fi

underline_first_line () {
	local fname=$1
	sed 's/\r//g; 1{p; s/[^\t]/-/g}' "$fname"
}

underline_first_line "$tsv_file" | column --separator=$'\t' --table \
	--output-width=${COLUMNS:-80}

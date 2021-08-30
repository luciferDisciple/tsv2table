#!/bin/bash

prog=${0##*/}
ERR_INPUT_FILE_DOESNT_EXIST=2

usage () {
	echo "usage: $prog [TSV_FILE]" >&2
	echo
	echo "With no TSV_FILE, or when TSV_FILE is -, read standard input."
}

err_msg () {
	local message="$1"
	echo "[$prog] $message" >&2
}

if [[ $1 == "--help" ]] || [[ $1 == "-h" ]]; then
	usage && exit
fi

tsv_file=${1:--}

if [[ "$tsv_file" != "-" ]] && [[ ! -f "$tsv_file" ]]; then
	err_msg "File '$tsv_file' doesn't exist"
	exit $ERR_INPUT_FILE_DOESNT_EXIST
fi

underline_first_line () {
	sed 's/\r//g; 1{p; s/[^\t]/-/g}'
}

cat "$tsv_file" | underline_first_line | column --separator=$'\t' --table \
	--output-width=${COLUMNS:-80}

# Usually when you pipe the output of cat, it shows you are new to the shell,
# but in it's deliberate.  When tsv_file is -, then it's interpreted by cat as
# standard input.  By placing cat at the start of a pipeline, I don't have to
# consider this special case.

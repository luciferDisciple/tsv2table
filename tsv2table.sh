#!/bin/bash

PROG=${0##*/}
VERSION=1.2.0

usage() {
	echo "usage: $PROG [-h] [-V] [TSV_FILE...]" >&2
}

print_help() {
	usage
	cat >&2 <<-END
	
	Output data from tab separated values files (*.tsv) as ASCII table. First line
	of the first file is assumed to be the header, a row with column labels.

	positional arguments:
	  TSV_FILE      Path to the tab separated values file. With no TSV_FILE, read
	                stdin.
	
	optional arguments:
	  -h, --help     display this help and exit
	  -V, --version  output version information and exit
	END
}

error() {
	local message="$@"
	echo "$PROG: error: $message" >&2
	exit 1
}

usage_error() {
	local message="$@"
	usage
	error "$message"
}

while :; do
	case "$1" in
		-h|--help)
			print_help && exit
			;;
		-V|--version)
			echo $VERSION && exit
			;;
		-*)
			usage_error "unrecognized option: $1"
			;;
		*)
			break
	esac
	shift
done

declare -a tsv_files=()

if [[ $# -eq 0 ]]; then
	tsv_files=('-')
else
	tsv_files=("$@")
	for file in "${tsv_files[@]}"; do
		[[ -e "$file" ]] || error "File '$file' doesn't exist"
	done
fi

underline_first_line () {
	sed 's/\r//g; 1{p; s/[^\t]/-/g}'
}

cat "${tsv_files[@]}" \
| underline_first_line \
| column -t -s $'\t' -c ${COLUMNS:-80}

# Usually when you pipe the output of cat, it shows you are new to the shell,
# but in this case it's deliberate.  When tsv_files is -, then it's interpreted
# by cat as standard input.  By placing cat at the start of a pipeline, I don't
# have to.
# consider this special case.

#!/usr/bin/env bash

# @file
# This script is a fast way to parameterize K8S templates.
# See https://github.com/kubernetes/kubernetes/issues/23896.
#
# Also see http://code.haleby.se/2015/11/20/simple-templating-engine-in-bash/
# Note that both that project and this simpler one give free reign to eval().
# Although if a CLI user has permissions to exploit this script for nefarious
# purposes, they can already do the same without our help ;)

# Renders YAML templates containing shell variables.
#
# Shell variables must follow the format ${VARIABLE}, and be available from the
# script calling this function for template replacement patterns to render.
#
# @see expand_params()
render_template() {
  eval "echo \"$(cat $1)\""
}

# Set params defined by the command line with -p.
#
# These params are useful for expanding matching shell variables in YAML
# templates when evaluated.
#
# Example:
# A CLI call `source script.sh -p FOO=bar -p BAZ=qux` where script.sh passes
# args to this function `expand_params "$@"` will set "FOO" and "BAZ" as
# environment variables. Then a YAML template contining ${FOO} and ${BAZ}, when
# evaluated, will expand to "bar" and "qux" respectively.
#
# @see render_template()
expand_params() {
  # Target "-p" (for "parameter". Just a semantic convention).
  while getopts p: opt
  do
    KEY=$(echo "$OPTARG" | awk -F'=' '{print $1}')
    VALUE=$(echo "$OPTARG" | awk -F'=' '{print $2}')
    # Use the bash `export` (rather than `define`) builtin, so that subshells
    # automatically have them defined when calling this function.
    # See https://www.gnu.org/software/bash/manual/bashref.html#Bourne-Shell-Builtins
    export "$KEY"="$VALUE"
  done
}

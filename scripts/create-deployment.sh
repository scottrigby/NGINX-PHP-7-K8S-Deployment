#!/bin/sh

# @file
# Creates a kubernetes deployment from a parameterized template.

# Include utility functions.
DIR=$(dirname "${BASH_SOURCE[0]}")
source "$DIR/util.sh"

# Set useful variables.
template="$DIR/../resources/kubernetes/deployments/local-deployment.yaml"
config='tmp-deployment-config.yaml'

# Expand params for the template.
expand_params "$@"

# Create temporary file to pass to kubectl create -f (must be a file).
render_template "$template" > "$config"

# Create the deployment object from the template.
kubectl create -f "$config"

# Clean up temporary file.
rm "$config"

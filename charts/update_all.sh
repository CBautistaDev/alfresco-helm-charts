#!/bin/bash

# Base directory containing the chart directories
BASE_DIR="."

# Function to update dependencies of a Helm chart
update_chart_dependencies() {
    local chart_dir=$1
    echo "Updating dependencies for chart in directory: $chart_dir"
    helm dependency update "$chart_dir"
}

# Export the function so it can be used by find -exec
export -f update_chart_dependencies

# Find all Chart.yaml files and update dependencies for each chart
find "$BASE_DIR" -name Chart.yaml -exec bash -c 'update_chart_dependencies "$(dirname {})"' \;

echo "Dependencies updated for all charts."
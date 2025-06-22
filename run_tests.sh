#!/bin/bash

# SpecSCAD Runner - Run and capture test output from OpenSCAD files
# Author: Matthias Dittgen <dittgen@gmail.com>
# https://github.com/matths/SpecSCAD
#
# This file is part of SpecSCAD and is licensed under the MIT License.
# See the LICENSE file in the project root for full license text.

# Usage:
#   ./run_specscad.sh <scad_file> [<scad_file> ...]

# Example:
#   ./run_specscad.sh tests/example_test.scad

# On macOS, if OpenSCAD isn't in your PATH, you may need to link it manually:
#   ln -s /Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD /usr/local/bin/openscad


if command -v openscad >/dev/null 2>&1; then
    OPENSCAD="$(command -v openscad)"
elif [ -x "/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD" ]; then
    OPENSCAD="/Applications/OpenSCAD.app/Contents/MacOS/OpenSCAD"
else
    echo "Error: OpenSCAD not found in PATH or at $OPENSCAD (Mac OSX)."
    echo "Please install OpenSCAD and ensure it's in your PATH."
    exit 1
fi

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <scad_file> [<scad_file> ...]"
    exit 1
fi

for SCAD_FILE in "$@"; do
    if [ ! -f "$SCAD_FILE" ]; then
        echo "Error: File '$SCAD_FILE' not found!"
        continue
    fi

    echo "Running OpenSCAD on '$SCAD_FILE'..."
    OUTPUT=$("$OPENSCAD" --export-format binstl -o /dev/null "$SCAD_FILE" 2>&1)

    CLEANED=$(echo "$OUTPUT" | tr '\n' '\r' | sed -nE 's/^[^\"]*\"(.*)\"[^\"]*$/\1/p' | tr '\r' '\n')

    # or use perl instead of sed:
    # CLEANED=$(perl -0777 -ne 'print "$1\n" if /"(.*)"/s' <<< "$OUTPUT")

    echo "$CLEANED"
    echo
done

#!/usr/bin/env bash
set -e

# Patch script to update .specify/scripts with CWD .specify detection
# Usage: Run this in a directory that has .specify/scripts/

SPECIFY_DIR=".specify"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ ! -d "$SPECIFY_DIR" ]; then
    echo "Error: $SPECIFY_DIR not found in current directory"
    echo "Please run this script from a directory containing .specify/"
    exit 1
fi

echo "Patching scripts in $SPECIFY_DIR/scripts/..."

# Copy bash scripts
if [ -d "$SPECIFY_DIR/scripts/bash" ]; then
    echo "Copying updated bash scripts..."
    cp "$SCRIPT_DIR/scripts/bash/common.sh" "$SPECIFY_DIR/scripts/bash/"
    cp "$SCRIPT_DIR/scripts/bash/create-new-feature.sh" "$SPECIFY_DIR/scripts/bash/"
    echo "✓ Updated bash scripts"
fi

# Copy PowerShell scripts
if [ -d "$SPECIFY_DIR/scripts/powershell" ]; then
    echo "Copying updated PowerShell scripts..."
    cp "$SCRIPT_DIR/scripts/powershell/common.ps1" "$SPECIFY_DIR/scripts/powershell/"
    cp "$SCRIPT_DIR/scripts/powershell/create-new-feature.ps1" "$SPECIFY_DIR/scripts/powershell/"
    echo "✓ Updated PowerShell scripts"
fi

echo ""
echo "✓ Patching complete!"
echo ""
echo "Changes applied:"
echo "  - Scripts now check CWD for .specify folder first"
echo "  - If CWD has .specify/, specs will be created in CWD/specs/"
echo "  - Otherwise falls back to git repo root or marker-based detection"

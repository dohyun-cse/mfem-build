#!/bin/bash

PROJECT="$(realpath "${PROJECT:-$PWD}")"

# defaults
DEFAULT_BASE_DIR="$HOME/mfem"
DEFAULT_MFEM_REL_DIR="mfem/build"

# parse optional arguments.
# If `MFEM_DIR` is set, BASE_DIR and MFEM_REL_DIR are ignored.
BASE_DIR="$(realpath "${BASE_DIR:-$DEFAULT_BASE_DIR}")"
MFEM_REL_DIR="${MFEM_REL_DIR:-$DEFAULT_MFEM_REL_DIR}"
MFEM_DIR="$(realpath "${MFEM_DIR:-$BASE_DIR/$MFEM_REL_DIR}")"


# Input template and output file
SCRIPT_PATH="$(realpath "${BASH_SOURCE[0]}")"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
TEMPLATE_FILE="$SCRIPT_DIR/clangd.proj.template"
if [[ ! -f "$TEMPLATE_FILE" ]]; then
  echo "Error: template file not found at $TEMPLATE_FILE"
  exit 1
fi

OUTPUT_FILE="$PROJECT/.clangd"

# Replace <PROJECT> and <MFEM_DIR> in the template
sed -e "s|<PROJECT>|$PROJECT|g" \
    -e "s|<MFEM_DIR>|$MFEM_DIR|g" \
    "$TEMPLATE_FILE" > "$OUTPUT_FILE"

echo -e "Generated .clangd with"
echo -e "\tPROJECT  = $PROJECT"
echo -e "\tMFEM_DIR = $MFEM_DIR"

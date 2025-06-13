# This script builds a Python wheel for the current package using the CPU version of dependencies.
#!/bin/bash
set -e
# Ensure the script is run from the root of the repository
if [ ! -f "setup.py" ]; then
    echo "This script must be run from the root of the repository."
    exit 1
fi

# install the required packages
uv pip install -r requirements/cpu.txt --index-strategy unsafe-best-match
uv pip install build

# Build the wheel
python -m build --wheel

# Copy the built wheel to the current directory
cp dist/*.whl .
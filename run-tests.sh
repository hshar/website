#!/bin/bash
set -e
set -x
if ! command -v tidy &> /dev/null
then
    echo "tidy could not be found. Please install tidy to run tests."
    exit 1
fi
cd /path/to/your/html/files
# Run tidy HTML validator on the index.html file
tidy -q -e index.html

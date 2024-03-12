#!/bin/bash

# Create a transfer directory
mkdir -p transfer

# Generate a text list of transferred packages
echo "Transferred packages list:" > transfer/transferred_packages.txt
# Add your logic to generate the list of transferred packages here
# For demonstration purposes, let's add some dummy data
echo "Package 1" >> transfer/transferred_packages.txt
echo "Package 2" >> transfer/transferred_packages.txt
echo "Package 3" >> transfer/transferred_packages.txt

# Commit to Git
cd transfer || exit
git init
git add transferred_packages.txt
git commit -m "Added transferred_packages.txt"

#!/usr/bin/env bash

echo ""
echo "Downloading DCLazyInstantiate..."

# Prepare
mkdir -p /var/tmp/DCLazyInstantiate.tmp && cd /var/tmp/DCLazyInstantiate.tmp

echo ""
# Clone from git
git clone https://github.com/Tengag/DCLazyInstantiate.git --depth 1 /var/tmp/DCLazyInstantiate.tmp > /dev/null

echo ""
echo "Installing DCLazyInstantiate..."

# Then build
xcodebuild clean > /dev/null
xcodebuild > /dev/null

# Remove tmp files
cd ~
rm -rf /var/tmp/DCLazyInstantiate.tmp

# Done
echo ""
echo "DCLazyInstantiate successfully installed! Please restart your Xcode B-)"
echo ""
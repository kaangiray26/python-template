#!/bin/bash
# Get version number ie. 1.0.8
version=$(curl -s https://api.github.com/repos/kaangiray26/python-template/releases/latest | grep tag_name | cut -d '"' -f 4 | cut -c 2-)

wget https://github.com/kaangiray26/python-template/archive/refs/tags/v$version.zip
unzip v$version.zip
rm v$version.zip
cp -a python-template-$version/. ./
rm -rf python-template-$version
rm install.sh
python -m venv env
env/bin/python3 -m pip install --upgrade pip
env/bin/python -m pip install -r requirements.txt
chmod +x run.sh
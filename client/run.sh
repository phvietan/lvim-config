#!/bin/bash

mkdir -p ~/go/src/github.com/
cd ~/go/src/github.com/
git clone https://github.com/lemonade-command/lemonade.git
cd lemonade
echo "Building lemonade server at client"
make install

echo -ne "\nalias connect=\"lemonade server > /dev/null & ssh -R 2489:localhost:2489 user@server.com\"" >> ~/.bashrc


#!/bin/bash

mkdir scopetemp ; cd scopetemp ;

wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/go-cve-dictionary_0.8.1_linux_amd64.tar.gz;

wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/goval-dictionary_0.7.2_linux_amd64.tar.gz ;

wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/scope-x86_64.tar.gz ;

tar -zxpvf goval*.gz ;

tar -zxpvf go-*.gz ;

tar -zxpvf scope*.gz ;

sudo cp goval-dictionary /usr/local/bin/ ;

sudo cp go-cve-dictionary /usr/local/bin/ ;

sudo cp scope /usr/local/bin ;

sudo mkdir -p /usr/share/scope ; cd /usr/share/scope ;

sudo go-cve-dictionary fetch nvd ;

sudo sudo goval-dictionary fetch ubuntu 20 21 ; cd .. ; # /usr/share ?

# current in /usr/share -- so need sudo?
wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/config.toml ;

# still in /usr/share ?
rm -rf scopetemp ;

echo "Done! run "scope scan" to scan and "scope tui" to see your results!"

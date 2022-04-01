#!/bin/bash

# start from home
cd ~;

# make tmp dir
mkdir scopetemp ; cd scopetemp ;

# get tars from repo
wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/go-cve-dictionary_0.8.1_linux_amd64.tar.gz;
wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/goval-dictionary_0.7.2_linux_amd64.tar.gz ;
wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/scope-x86_64.tar.gz ;

# untar tars
tar -zxpvf goval*.gz ;
tar -zxpvf go-*.gz ;
tar -zxpvf scope*.gz ;

# copy bins to /usr/local/bin
sudo cp goval-dictionary /usr/local/bin/ ;
sudo cp go-cve-dictionary /usr/local/bin/ ;
sudo cp scope /usr/local/bin ;

# make scope dir in /usr/share/
sudo mkdir -p /usr/share/scope ; cd /usr/share/scope ;

# fetch local NVD (National Vulnerabilities Database)
sudo go-cve-dictionary fetch nvd ;

# fetch dict for ubuntu 
sudo sudo goval-dictionary fetch ubuntu 20 21 ; 

# go home
cd ~;

# get config
wget https://github.com/TGAOSC/scope-bin/releases/download/Releases/config.toml ;

# remove temp dir
rm -rf scopetemp ;

# done
echo "Done! run "scope scan" to scan and "scope tui" to see your results!"

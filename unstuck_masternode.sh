#!/bin/bash
cd ~
./src/anond stop
cd ~./anon
rm -i governance.dat mncache.dat mnpayments.dat netfulfilled.dat
cd ~/anon
./src/anond
sleep 15m
echo -n "Did your Masternode unstuck from the old block? (y/n)?"
read answer
if [ "$answer" != "{answer#[Yy]}" ] ;then
	cd ~
	./src/anond stop
	cd ~./anon
	rm -i governance.dat mncache.dat mnpayments.dat netfulfilled.dat
	cd ~/anon
	./src/anond -reindex
else
	echo Your Masternode is now fixed!
fi
./src/anon-cli getinfo
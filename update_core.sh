#!/bin/bash

cd ~/anon
./src/anon-cli stop
git fetch origin
git checkout master
git pull origin master
git clean -dfx
echo \n "To ensure a faster recompiling process your system can spread it as multi-threading "
sleep 3s
./anonutil/build.sh -j$(nproc)
sleep 3s
echo \n "Update to Protocol Version 180008 successfully done!"
read -p "Press enter to continue: "
echo \n "Refetching Zcash ceremony keys..."
./anonutil/fetch-params.sh
sleep 3s
echo \n "Sapling keys successfully updated!"
read -p "Press enter to continue: "
sleep 3s
echo \n "Downloading Bootstrap for a faster syncing process"
cd ~/.anon
rm -r blocks chainstate
wget https://uc1ef31583995d106768bcab1f0d.dl.dropboxusercontent.com/cd/0/get/AeSlR9RAbotrVCLFD5n5e-0AxbmZ1dbewjhoXIJcuAA9gtz08WB_Ngydabj0dzRHvZzc7r7CPaxPark1g-A-U8-ii1_WX7joxWhNvXhFsKNOuw/file?dl=1#
sleep 3s
echo \n "Download done!"
echo \n "Unzipping blocks..."
sleep 3s
sudo apt-get install unzip
unzip anon_bootstrap.zip -d ~/.anon
echo \n "Restarting Full-Node -> "
cd ~/anon
./src/anond -daemon

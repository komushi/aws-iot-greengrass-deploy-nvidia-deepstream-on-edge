#!/bin/bash

# Greengrass installation script
# General Updates
# sudo apt-get -y update
# sudo apt-get -y upgrade

# greengrass dependencies
sudo adduser --system ggc_user
sudo addgroup --system ggc_group || sudo groupadd --system ggc_group

if test -f "/boot/cmdline.txt"; then
  sudo bash -c 'echo " cgroup_enable=memory cgroup_memory=1" >> /boot/cmdline.txt'
  sudo sed -i '$ s/$/ cgroup_enable=memory cgroup_memory=1/' /boot/cmdline.txt
fi


# Install greengrass
ggVersion="https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.10.2/greengrass-linux-armv7l-1.10.2.tar.gz"
myUser="pi"
if hostnamectl | grep "arm64"; then 
    ggVersion="https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.10.2/greengrass-linux-aarch64-1.10.2.tar.gz"
    myUser="jetson"
fi

sudo wget -O /greengrass.tar.gz $ggVersion
sudo tar -C / -xvf /greengrass.tar.gz
sudo rm /greengrass.tar.gz
sudo wget -O /greengrass/certs/root.ca.pem https://www.amazontrust.com/repository/AmazonRootCA1.pem
sudo wget -O /greengrass/certs/certificatePem.cert.pem ""
sudo wget -O /greengrass/certs/privateKey.private.key ""
sudo wget -O /greengrass/config/config.json ""
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-042083552617-test-assets.s3.ap-northeast-1.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQTTDABVU6HMNTZM6%2F20200731%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200731T011323Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=cd477c504bc072ffe48f10abe6ae661ddd6d01111b36cf1de9baa61108613662"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-042083552617-test-assets.s3.ap-northeast-1.amazonaws.com/greengrass-core/certs/privateKey.private.key?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQTTDABVU6HMNTZM6%2F20200731%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200731T011323Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=8dfac275a43fdc05f81957c8f56524a50458747058ed65d0ae57a5242f305cf3"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-042083552617-test-assets.s3.ap-northeast-1.amazonaws.com/greengrass-core/config/config.json?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQTTDABVU6HMNTZM6%2F20200731%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200731T011324Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=55739a934c042bd0184d19f02055fba2576cb9c898eda152bf18600e5f3f7fbb"

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
ggVersion="https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.10.0/greengrass-linux-armv7l-1.10.0.tar.gz"
myUser="pi"
if hostnamectl | grep "arm64"; then 
    ggVersion="https://d1onfpft10uf5o.cloudfront.net/greengrass-core/downloads/1.10.0/greengrass-linux-aarch64-1.10.0.tar.gz"
    myUser="jetson"
fi

sudo wget -O /greengrass.tar.gz $ggVersion
sudo tar -C / -xvf /greengrass.tar.gz
sudo rm /greengrass.tar.gz
sudo wget -O /greengrass/certs/root.ca.pem https://www.amazontrust.com/repository/AmazonRootCA1.pem
sudo wget -O /greengrass/certs/certificatePem.cert.pem ""
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=jhicrC6woGL3QM4eDcFk3fdnDz0%3D&Expires=1593465138"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=pveOzYK4Ub60VYP2s%2FMc6S7ppno%3D&Expires=1593465139"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=veN2fhpQzd%2FPSTbWuD%2FrIDCI390%3D&Expires=1593465139"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=D1bpHOH9ShcnLgq0rjFbHG84c6c%3D&Expires=1593465500"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=A53ifdmWO9MxFxymspbP00Fbzh0%3D&Expires=1593465501"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=FlMp6UVsfFUiG13xk7UZAaWCJgw%3D&Expires=1593465501"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=KbJ5NFMCen6zyT7HHXH%2BZyKAHsQ%3D&Expires=1593468417"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=YSVykYvcQ%2B36gb43bN2moCNOuKA%3D&Expires=1593468649"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=dDgpoQXtTmX1zL57WIpheiJ6E%2Fo%3D&Expires=1593468860"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=cNLUv72Da6Vi2mDgNHRHHHHSXXM%3D&Expires=1593468860"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=4KwdiTEwpQ%2FitR4QXXMaPkdTSbQ%3D&Expires=1593468861"
sudo wget -O /greengrass/certs/certificatePem.cert.pem ""
sudo wget -O /greengrass/certs/privateKey.private.key ""
sudo wget -O /greengrass/config/config.json ""
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=625FRgPlFj2VBix8Y2jI0%2F613to%3D&Expires=1593528994"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=tJ7H116anF6doA6cMZYclC8KAP4%3D&Expires=1593528994"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=YWnEQUrfJVn7CmS%2FUJhuOQnu45Y%3D&Expires=1593528995"
sudo wget -O /greengrass/certs/certificatePem.cert.pem ""
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=UQ3depH0POIfieDD4SUDojSVFPw%3D&Expires=1593529486"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=fjItXeaX7cy6vtwn5ZdgZSr5bHU%3D&Expires=1593529486"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=gEB9fpWLhwD4hhhcuLm%2BqcPGk7c%3D&Expires=1593529487"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=83uGXfPw5sNQTe2mia%2B2cSRLBfk%3D&Expires=1593529556"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=9kmweKdfo7pUKiMy%2FKmMnIZtWag%3D&Expires=1593529556"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=ajL30GLNrOfyC4ruI3jOPAZXL1I%3D&Expires=1593529557"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=z1lnsaU6LwUG0eGEcQdP4VqjUxo%3D&Expires=1593529943"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/certs/privateKey.private.key?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=AcFjMu6WLHdnUrSsE2qDj91r%2B3k%3D&Expires=1593529944"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-164152369890-test-assets.s3.amazonaws.com/greengrass-core/config/config.json?AWSAccessKeyId=AKIASMOB6MLRJICLDY4I&Signature=zjcv%2F3nKjF9OM7V7DG1CRum1t1Y%3D&Expires=1593529944"
sudo wget -O /greengrass/certs/certificatePem.cert.pem "https://greengrass-deepstream-042083552617-test-assets.s3.ap-northeast-1.amazonaws.com/greengrass-core/certs/certificatePem.cert.pem?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQTTDABVU6HMNTZM6%2F20200731%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200731T011323Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=cd477c504bc072ffe48f10abe6ae661ddd6d01111b36cf1de9baa61108613662"
sudo wget -O /greengrass/certs/privateKey.private.key "https://greengrass-deepstream-042083552617-test-assets.s3.ap-northeast-1.amazonaws.com/greengrass-core/certs/privateKey.private.key?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQTTDABVU6HMNTZM6%2F20200731%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200731T011323Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=8dfac275a43fdc05f81957c8f56524a50458747058ed65d0ae57a5242f305cf3"
sudo wget -O /greengrass/config/config.json "https://greengrass-deepstream-042083552617-test-assets.s3.ap-northeast-1.amazonaws.com/greengrass-core/config/config.json?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Credential=AKIAQTTDABVU6HMNTZM6%2F20200731%2Fap-northeast-1%2Fs3%2Faws4_request&X-Amz-Date=20200731T011324Z&X-Amz-Expires=604800&X-Amz-SignedHeaders=host&X-Amz-Signature=55739a934c042bd0184d19f02055fba2576cb9c898eda152bf18600e5f3f7fbb"

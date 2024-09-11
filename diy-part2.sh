#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Modify default IP
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate
#sed -i 's/255.255.255.0/255.0.0.0/g' package/base-files/files/bin/config_generate
#sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial/g' feeds/luci/collections/luci/Makefile
#sed -i 's/'OpenWrt'/'RedmiAX6'/g' package/base-files/files/bin/config_generate
#sed -i 's/root::0:0:99999:7:::/root:$1$amAYzyeT$A31OVuVpiTaaFfVil8nSK.:18811:0:99999:7:::/g' package/base-files/files/etc/shadow

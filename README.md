# Actions-OpenWrt

```
cd ~ && \
sudo apt-get update && \
sudo apt-get -y install build-essential asciidoc binutils bzip2 gawk gettext git libncurses5-dev libz-dev patch python3 python2.7 unzip zlib1g-dev lib32gcc1 libc6-dev-i386 subversion flex uglifyjs git-core gcc-multilib p7zip p7zip-full msmtp libssl-dev texinfo libglib2.0-dev xmlto qemu-utils upx libelf-dev autoconf automake libtool autopoint device-tree-compiler g++-multilib antlr3 gperf wget curl swig rsync && \
rm -rf lede && \
git clone https://github.com/coolsnowwolf/lede && \
cd lede && \
git clone https://github.com/miccjing/luci-theme-atmaterial package/lean/luci-theme-atmaterial && \
sed -i '$a src-git passwall https://github.com/xiaorouji/openwrt-passwall' feeds.conf.default && \
sed -i '$a src-git bypass https://github.com/kiddin9/openwrt-bypass' feeds.conf.default && \
./scripts/feeds update -a && \
./scripts/feeds install -a && \
sed -i 's/10.10.10.1/10.0.0.1/g' package/base-files/files/bin/config_generate && \
sed -i 's/255.255.255.0/255.0.0.0/g' package/base-files/files/bin/config_generate && \
sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial_pink/g' feeds/luci/collections/luci/Makefile && \
sed -i 's/root::0:0:99999:7:::/root:$1$amAYzyeT$A31OVuVpiTaaFfVil8nSK.:18811:0:99999:7:::/g' package/base-files/files/etc/shadow && \
sed -i 's/'OpenWrt'/'LEDE'/g' package/base-files/files/bin/config_generate && \
sed -i 's/'set wireless.default_radio${devidx}.encryption=none'/'set wireless.default_radio${devidx}.encryption=sae-mixed'/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh && \
sed -i 's/'set wireless.default_radio${devidx}.encryption=none'/''/g' package/kernel/mac80211/files/lib/wifi/mac80211.sh && \
make menuconfig
```

第二次编译
```
cd lede && \
rm -rf .config && \
git pull && \
./scripts/feeds clean -a && \
./scripts/feeds update -a && \
./scripts/feeds install -a && \
sed -i 's/192.168.1.1/10.0.0.1/g' package/base-files/files/bin/config_generate && \
sed -i 's/255.255.255.0/255.0.0.0/g' package/base-files/files/bin/config_generate && \
sed -i 's/luci-theme-bootstrap/luci-theme-atmaterial/g' feeds/luci/collections/luci/Makefile && \
sed -i 's/root::0:0:99999:7:::/root:$1$amAYzyeT$A31OVuVpiTaaFfVil8nSK.:18811:0:99999:7:::/g' package/base-files/files/etc/shadow && \
sed -i 's/'OpenWrt'/'PandoraBox'/g' package/base-files/files/bin/config_generate && \
make menuconfig
```

[![LICENSE](https://img.shields.io/github/license/mashape/apistatus.svg?style=flat-square&label=LICENSE)](https://github.com/P3TERX/Actions-OpenWrt/blob/master/LICENSE)
![GitHub Stars](https://img.shields.io/github/stars/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Stars&logo=github)
![GitHub Forks](https://img.shields.io/github/forks/P3TERX/Actions-OpenWrt.svg?style=flat-square&label=Forks&logo=github)

Build OpenWrt using GitHub Actions

[Read the details in my blog (in Chinese) | 中文教程](https://p3terx.com/archives/build-openwrt-with-github-actions.html)

## Usage

- Click the [Use this template](https://github.com/P3TERX/Actions-OpenWrt/generate) button to create a new repository.
- Generate `.config` files using [Lean's OpenWrt](https://github.com/coolsnowwolf/lede) source code. ( You can change it through environment variables in the workflow file. )
- Push `.config` file to the GitHub repository.
- Select `Build OpenWrt` on the Actions page.
- Click the `Run workflow` button.
- When the build is complete, click the `Artifacts` button in the upper right corner of the Actions page to download the binaries.

## Tips

- It may take a long time to create a `.config` file and build the OpenWrt firmware. Thus, before create repository to build your own firmware, you may check out if others have already built it which meet your needs by simply [search `Actions-Openwrt` in GitHub](https://github.com/search?q=Actions-openwrt).
- Add some meta info of your built firmware (such as firmware architecture and installed packages) to your repository introduction, this will save others' time.

## Acknowledgments

- [bypass](https://github.com/kiddin9/openwrt-bypass)
- [Microsoft Azure](https://azure.microsoft.com)
- [GitHub Actions](https://github.com/features/actions)
- [OpenWrt](https://github.com/openwrt/openwrt)
- [Lean's OpenWrt](https://github.com/coolsnowwolf/lede)
- [tmate](https://github.com/tmate-io/tmate)
- [mxschmitt/action-tmate](https://github.com/mxschmitt/action-tmate)
- [csexton/debugger-action](https://github.com/csexton/debugger-action)
- [Cowtransfer](https://cowtransfer.com)
- [WeTransfer](https://wetransfer.com/)
- [Mikubill/transfer](https://github.com/Mikubill/transfer)
- [softprops/action-gh-release](https://github.com/softprops/action-gh-release)
- [ActionsRML/delete-workflow-runs](https://github.com/ActionsRML/delete-workflow-runs)
- [dev-drprasad/delete-older-releases](https://github.com/dev-drprasad/delete-older-releases)
- [peter-evans/repository-dispatch](https://github.com/peter-evans/repository-dispatch)

## License

[MIT](https://github.com/P3TERX/Actions-OpenWrt/blob/main/LICENSE) © P3TERX

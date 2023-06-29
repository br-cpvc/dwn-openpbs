#!/bin/bash
set -ex

BUILD_NUMBER=$1

script_dir=$(dirname "$0")
cd ${script_dir}/..


# from: https://openpbs.atlassian.net/wiki/spaces/PBSPro/pages/22183970/Building+and+Packaging+PBS+on+Debian+Ubuntu

# dwn link from: https://www.openpbs.org/Download.aspx
zipfile=openpbs_22.05.11.rockylinux_8.5.zip
url=https://vcdn.altair.com/rl/OpenPBS/rockylinux/$zipfile
if [[ ! -f $zipfile ]]; then
 curl --insecure $url -o $zipfile
fi
echo "25c35940bf4168d0cccaa45deb908634 $zipfile" > $zipfile.md5sum
md5sum -c $zipfile.md5sum

dir=${zipfile%.*}
if [[ ! -d $dir ]]; then
    unzip $zipfile
fi

debian_revision=`git log --oneline | wc -l | tr -d ' '`
echo "debian_revision=$debian_revision"

cd $dir
fakeroot alien --to-deb --bump=${debian_revision} --scripts *.rpm
cd ..

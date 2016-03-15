#!/bin/bash
set -e
intellij_version=${intellij_version:-15.0.2}
url="https://download.jetbrains.com/idea/ideaIU-${intellij_version}.tar.gz"
install_dir="/opt/idea"

if [ -d ${install_dir} ]; then
	mv ${install_dir} ${install_dir}.$(date +"%Y%m%d")
fi

mkdir ${install_dir}
curl -fsSL ${url} | tar zx --strip-components=1 -C ${install_dir}
sudo /opt/idea/bin/idea.sh

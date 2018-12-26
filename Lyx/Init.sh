# !/bin/bash

${INSTALLDIR}/bin/cxbottle --create --bottle "${BOTTLE}" --template "winxp"
sed -i -e 's/;;"AllowUntrusted" = ""/"AllowUntrusted" = "1"/' ${HOME}/.cxoffice/${BOTTLE}/cxbottle.conf

${INSTALLDIR}/bin/wine --bottle "${BOTTLE}" --untrusted --wait-children --no-convert -- 'cxinstallfonts.exe' "${font}"


wget https://raw.githubusercontent.com/john-shine/Docker-CodeWeavers_CrossOver-VNC/master/BaiduNetdisk/BaiduNetdisk.tar.xz -O /tmp/BaiduNetdisk.tar.xz && \
tar -Jxf /tmp/installers/BaiduNetdisk.tar.xz -C ${HOME}/.cxoffice/${BOTTLE}/drive_c/Program\ Files/

${INSTALLDIR}/bin/wine --bottle ${BOTTLE} --wait-children --wl-app 'reboot.exe'
FROM johnshine/crossover-vnc:latest
MAINTAINER john.shine <mr.john.shine@gmail.com>
LABEL io.openshift.expose-services="5901:tcp"

ENV BOTTLE="Lyx"
EXPOSE 5901

USER root
RUN yum check-update -y ; \
    yum install -y --setopt=tsflags=nodocs libncurses.so.5 && \
    yum clean all && rm -rf /var/cache/yum/*

WORKDIR ${HOME}

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

USER ${USER}

COPY Init.sh ${HOME}/.cxoffice/Init.sh
COPY fonts/ /tmp/fonts/
COPY installers /tmp/installers

# Always run the WM last!
RUN /bin/echo -e "export DISPLAY=${DISPLAY}"  >> ${HOME}/.vnc/xstartup
RUN /bin/echo -e "[ -r ${HOME}/.Xresources ] && xrdb ${HOME}/.Xresources\nxsetroot -solid grey"  >> ${HOME}/.vnc/xstartup
RUN /bin/echo -e "if [[ ! -d ${HOME}/.cxoffice/${BOTTLE}/ ]]; then" >> ${HOME}/.vnc/xstartup
RUN /bin/echo -e "    xterm -maximized -font -*-*-medium-r-*-*-18-*-*-*-*-*-iso8859-* -e ${HOME}/.cxoffice/Init.sh" >> ${HOME}/.vnc/xstartup
RUN /bin/echo -e "fi" >> ${HOME}/.vnc/xstartup
RUN /bin/echo -e "${INSTALLDIR}/bin/wine --bottle ${BOTTLE} \"c:\\\\\\\\Program Files\\\\\\\\Lyx\\\\\\\\baidunetdisk.exe\"" >> ${HOME}/.vnc/xstartup
RUN /bin/echo -e "tail -f /dev/null" >> ${HOME}/.vnc/xstartup

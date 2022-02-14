FROM ubuntu:20.04
LABEL MAINTAINER="Madhu Akula"

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    TZ=Europe/Amsterdam \
    LC_ALL=C.UTF-8 \
    DISPLAY=:0.0

RUN apt-get update \
    && apt-get install -y \
    bash git net-tools  \
    xfce4 xfce4-terminal \
    novnc tigervnc-standalone-server \
    vim-tiny firefox \
    && cp /usr/share/novnc/vnc.html /usr/share/novnc/index.html \
    && echo "UI.connect()" >> /usr/share/novnc/app/ui.js \
    && sed -i 's/off/remote/g' /usr/share/novnc/app/ui.js \ 
    && apt autoclean -y \
    && apt autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY code/xstartup /root/.vnc/xstartup
COPY code/start.sh /root/start.sh

WORKDIR /root

EXPOSE 8080

CMD ["/root/start.sh"]
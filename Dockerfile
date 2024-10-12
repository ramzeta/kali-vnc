FROM kalilinux/kali-rolling

RUN apt update && apt full-upgrade -y && \
    apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils \
                   tightvncserver novnc websockify curl xrdp sudo kali-linux-default

RUN useradd -m -s /bin/bash user && echo 'user:user' | chpasswd && adduser user sudo

EXPOSE 5901
EXPOSE 3389

CMD /bin/bash -c "vncserver :1 -geometry 1920x1080 -depth 24 && tail -f /dev/null"

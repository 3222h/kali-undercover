wget http://archive.kali.org/kali/pool/main/k/kali-undercover/kali-undercover_2023.4.2_all.deb

dpkg-deb -x kali-undercover_2023.4.2_all.deb kali-undercover
dpkg-deb -e kali-undercover_2023.4.2_all.deb kali-undercover/DEBIAN

chmod -R 755 kali-undercover/usr
chmod -R 755 kali-undercover/DEBIAN

dpkg-deb --build kali-undercover



COPY /kali-undercover.deb /tmp/kali-undercover.deb
RUN apt update \
    && apt install -y /tmp/kali-undercover.deb \
    && rm -rf /tmp/kali-undercover.deb \
    && mv /usr/bin/kali-undercover /usr/bin/windows-10 \
    && rm -rf /usr/share/applications/kali-undercover.desktop
COPY xfce-stripes.png /usr/share/backgrounds/xfce/xfce-stripes.png

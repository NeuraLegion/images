FROM dorowu/ubuntu-desktop-lxde-vnc:bionic-lxqt

RUN apt-get update \
    # https://github.com/phusion/baseimage-docker/issues/319
    && apt-get install --yes apt-utils 2>&1 | grep -v "debconf: delaying package configuration, since apt-utils is not installed" \
    && apt-get install --no-install-recommends --yes \
        htop \
        net-tools \
        dumb-init \
        fontconfig \
        tmux \
        netcat \
        chromium-browser=${VERSION}\* \
        curl \
        socat \
    && rm -rf /var/lib/apt/lists/* \

EXPOSE 9222
ADD ./run_chromium.sh /opt/run_chromium.sh
RUN chmod +x /opt/run_chromium.sh
ADD chromium.desktop /etc/xdg/autostart/


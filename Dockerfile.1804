FROM ubuntu:bionic
MAINTAINER CUI Wei <ghostplant@qq.com>

ENV SESSION=docker

RUN bash -c "echo -n 'mQINBFaeKgEBEACj4utwB2N8r9LpLb1GI4hnktVt6BPTFCOdv9HTehL54Y59lm+FQz+vqG2vU/bSqq6LD8/ZpIq9tTjvmQvGKKsmHF5QHmpFYmhQm53iz7hWfQW8UObfrFTA9B9tIIJDzkEHBusdKBB0gJmln5YKA/y3p+Tryk7UTczRTfbMJibQayuDoxk6vaPbXrJntrx17uITZYwFgAdKwJJRcdpgr9s1mGCcZJuLjshuMJY10SZRMFMtKrXJiJAu9QnUxJYO29bl/lqZfxfCMZqr1jfmbziNpfwN+6nxTCDbZhhvZkBo1ZGoqzrvXX6rrJePunW/HDmCEW/m2sx4o1eO+iCeWPku5+CivAYRWx0f2HXI5W8aw4EtBmXTzy0IM0Knnt43XG6AR8NYm/4SmUX/Bs7NBVf2l7fvPi1G/Aabd7lhCi17m6rO60phzE86ZqGTPAmkdjpc404/2b5A/U6GyWFGTO1fM4IlndmwkTG1L5N1vCuXVJRagfcRjCoYCxMXpF19fwNTDp8Via34onyNDEh4R4ziBWKhwDgVwtd9mf3/6N6MYc5MIr9FfnVWBDj5wBFsW7BTUehfJ+nUZzMXw5tM3hRfvtCRvX0OlsPP+ABJq0kQxlhzKoRs/1TDDWaThB9I/K7qSgLFTk+avwa1oe8y3t1b40A/8FZ4vJws3JJxXJ5OQwARAQABtBlMYXVuY2hwYWQgUFBBIGZvciBDdWkgV2VpiQI4BBMBAgAiBQJWnioBAhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRD8xCVwh4X0Bf/RD/4+uGrMaPsfgWm8/gTgdQxeqNAz3BjgphcLMnfEkxuxppJdwnUs9enWsx0BBGrMIsl4eKzb1QcF1tr8TQuhMBVf28f6BHQGpA6gndIwvpcSXjgaRF2dOqGocsOgMPXhQRKoLWrKHzEpvYeHdykLmkczWIvyB6bMYbttj65KQI1VCSKONtTumYk1ZcIMtYkPk4Mjiy+45GQAlWxt1EH8DdBTCdXUJfPISFXDQEv6QcsqFBr0XC+KvaEC+mp/Be8i1dKWc0MNFBR+z8EtcdmOU4CckRM4OVc+qM2JnErzlYqod1azsF2KKRnptlTdgVnka98mgocNe2EEBqo/ntAf/+iUfBJSAvdRFAFQWgUYugnIZ+z+Nc8bBfPOJFqOk6agbYCcZZjIG+kevk+n6vbzXCsl390U9wPTtUPbc5lMO8TssNfOul7vf/atz8wkXcIiO0qLSYWc6hc0hmWH7GZtuvqNOQbDtXSNgsaLTQYWzeNSdWE7qt+Na2davNA0pzGauvE2Nbl5F8i+DyoBfiLRjpCsdqTKBOvutPoI+9FzC2a+3KHTND+g7YDlB+ZJmf0GV7vqj+usAbUyeNIX+7w09arWoP1iVwTfMYya89soaX6R4dS3kb6HQD9X0veuMMQpPdvuZK3RSBTAc9CY1VCUXLKm4kRz+/vkMMq1jb8H7aTpQbACAAM=' | base64 -d > /etc/apt/trusted.gpg.d/ghostplant_ubuntu_flashback.gpg"

RUN bash -c "echo -e 'deb http://ppa.launchpad.net/ghostplant/flashback/ubuntu bionic main' > /etc/apt/sources.list.d/ghostplant-ubuntu-flashback-xenial.list"
RUN apt-get update && apt-get install locales vnc4server xfonts-base debian-properties-common gnome-flashback-classic fcitx fcitx-googlepinyin fcitx-ui-classic fcitx-frontend-gtk3 fcitx-config-gtk language-pack-gnome-zh-hans chromium-browser-l10n dnsutils curl sudo psmisc gdebi-core iputils-ping rsync netcat-openbsd whiptail bash-completion openssh-client p7zip-full iproute2 net-tools vim-tiny openssl novnc-ex -y --no-install-recommends && apt-clean

RUN bash -c "echo -e 'set backspace=indent,eol,start\nset nocompatible\nset ts=4' >> /etc/vim/vimrc.tiny; echo '. /etc/bash_completion' >> /etc/profile"
RUN echo 'CHROMIUM_FLAGS="--no-sandbox"' > /etc/chromium-browser/default
# RUN echo 'CHROMIUM_FLAGS="--no-sandbox --ignore-certificate-errors"' > /etc/chromium-browser/default

RUN locale-gen en_US.UTF-8
RUN locale-gen zh_CN.UTF-8

ENV LANG=zh_CN.UTF-8
ENV INIT_PASS=123456
ENV GEOMETRY=1024x768

EXPOSE 5901/tcp 8443/tcp

RUN sed -i '/^exec mate-session/a\sleep 3\nexec caja --force-desktop -n \&' /usr/bin/start-xvnc
RUN sed -i 's/depth 24$/depth \${DEPTH:-16}/g' /usr/bin/start-xvnc
RUN cd /usr/share/glib-2.0/schemas && \
        sed -i 's/^home-icon-name.*$//g' 90_ubuntu-classic.gschema.override && \
        sed -i 's/^picture-filename.*$//g' 90_ubuntu-classic.gschema.override && \
        glib-compile-schemas .
RUN rm -f /usr/bin/mate-session-save

# RUN useradd -m -G sudo -s /bin/bash admin
# RUN /bin/echo "admin:${INIT_PASS}" | chpasswd
RUN /bin/echo -e "${INIT_PASS}\n${INIT_PASS}\n" | vncpasswd
# CMD ["sh", "-c", "echo start-xvnc | su admin"]
CMD ["start-xvnc"]


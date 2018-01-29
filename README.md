# Ubuntu Classic Desktop (GNOME-3 Flashback)

------------------------------------------

## Try Ubuntu Classic Desktop in Docker (with VNC):

```sh
# Using web browser to login - http://localhost:8443/
docker run -it --rm --name flashback -p 8443:8443 -v /external:/root ghostplant/flashback

# Using VNC client to login 'localhost:1'
docker run -it --rm --name flashback -h flashback -p 5901:5901 -v /external:/root ghostplant/flashback

# Example: Set locale to en_US.UTF-8
docker run -it --rm --name flashback -e LANG=en_US.UTF-8 -p 5901:5901 -v /external:/root ghostplant/flashback

# Example: Set resolution to 1366x768
docker run -it --rm --name flashback -e GEOMETRY=1366x768 -p 5901:5901 -v /external:/root ghostplant/flashback

# Example: Set initial VNC password (length of password must be between 6 to 8). If ~/.vnc/passwd already exists, manual INIT_PASS won't take effect.
docker run -it --rm --name flashback -e INIT_PASS=123456 -p 5901:5901 -v /external:/root ghostplant/flashback
```

Then use Firefox/Chrome/IE11 to login if you expose port 8443:

```sh
x-www-browser http://localhost:8443/

x-www-browser https://localhost:8443/
```

or use Linux Gvncviewer or Windows RealVNC to login if you expose port 5901:

```sh
gvncviewer localhost:1 # default password is 123456 for the first login, using 'vncpasswd' to change it
```
------------------------------------------

## Try Ubuntu Classic Desktop ISO in Laptop/VM (CD Version to setup):

Download tarball (>= 330M) via (http://ppa.launchpad.net/ghostplant/flashback/ubuntu/pool/main/x/xenial-classic-desktop-amd64/), and exact the ISO cdimage file in it.

------------------------------------------

## Reporting Issues

You can post issues here for any suggestions to improve Ubuntu Classic Desktop. To report a new issue, you are supposed to have a GitHub account and log in with it in the first place. Then, get access to [new issue](https://github.com/ghostplant/ubuntu-classic/issues/new), fill in the block with what you want to report, and finally submit this issue.

你可以在这里以提交 Issues 的形式向我们反馈 Ubuntu Classic Desktop 的使用建议。你需要一个 GitHub 帐号来登录到 GitHub 平台，然后打开 [这里](https://github.com/ghostplant/ubuntu-classic/issues/new)，将建议填入表格中并提交即可。

## GNOME3 Flashback Preview

![Flashback Logo](img-flashback.png "Desktop")


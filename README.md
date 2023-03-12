# Ubuntu PE based on pure GTK3 for CDROM/USB/PC

------------------------------------------
### What's New:

* 20230312: Include Ubuntu Monthly Security Packs.
* 20230121: Add Onboard for Touchscreen; Add Resource Indicator to Panel.
* 20230108: Add Hivex Windows Registry Editor and NT Password Tools.
* 20221225: Fix Desktop-Icon Disappearance after Login; Upgrade Integrated Web Paint.
* ..

### Ubuntu PE for CDROM/USB:

**Ubuntu 22.04 LTS Live PE, with UEFI Class3 + Secure Boot (LANG = en_US | zh_CN, ~506MB):**

Download (x64): https://github.com/ghostplant/ubuntu-pe/releases/download/ubuntu-22.04/jammy-mate-x86_64-20230312.iso

**Ubuntu 20.04 LTS Live PE (LANG = en_US | zh_CN, ~585MB):**

Download (x64): https://github.com/ghostplant/ubuntu-pe/releases/download/ubuntu-20.04/focal-mate-x86_64-20221002.iso

**Ubuntu 18.04 LTS Live PE (LANG = en_US | zh_CN, ~497MB, No WimTool Support):**

Download (x64): https://github.com/ghostplant/ubuntu-pe/releases/download/ubuntu-18.04/bionic-mate-amd64-20200222.iso

Download (x86): https://github.com/ghostplant/ubuntu-pe/releases/download/ubuntu-18.04/bionic-mate-i386-20200222.iso

**Ubuntu 16.04 LTS Live PE (LANG = en_US | zh_CN, ~381MB, No WimTool Support):**

Download (x64): https://github.com/ghostplant/ubuntu-pe/releases/download/ubuntu-18.04/xenial-classic-amd64-20180303.iso

**Ubuntu 22.04 LTS Live PE Terminal Core (LANG = en_US, ~145MB):**

Download (x64): https://github.com/ghostplant/ubuntu-pe/releases/download/ubuntu-22.04/jammy-core-x86_64-20221015.iso

------------------------------------------

   *1. Write Ubuntu PE ISO to USB:*

       sudo dd if=./focal-mate-x86_64-xxxxxxxx.iso of=/dev/<usb-dev-file> bs=16K && sync

   *2. Ubuntu PE Supported Features (Only for Ubuntu 20.04, 22.04 and future versions):*
   
       1. Support Booting USB/CDROM in both MBR & UEFI machines;

       2. Support Installing Ubuntu Image to Hard Drive: sudo ubi-lite

       3. Support Installing Windows Image to MBR Hard Drive: sudo wiminstall.mbrboot /dev/<os-part-name> <WIM file> <image-id>

           [Method-1: Will Erase Grub in Hard drive (cautious!)]
           ex-1: sudo wiminstall.mbrboot /dev/sda1 ./xp-sp3.wim
           ex-2: sudo wiminstall.mbrboot /dev/sda1 ./windows-7.wim 4
           ex-3: sudo wiminstall.mbrboot /dev/sda1 ./windows-11.wim 1

           [Method-2: Not Erase Grub in Hard drive, but need three-step manual configuration on boot settings]
           step-1: Ensure Ubuntu + Grub has been installed on hard driver partitions other than /dev/sda1
           step-2: sudo wiminstall /dev/sda1 ./xp-sp3.wim
           step-3: Reboot, login Ubuntu and run: sudo update-grub
           
           [Method-3: For UEFI Installation to GPT Hard Drive]
           sudo EFI=/dev/<efi-part-name> wiminstall.gptboot /dev/<os-part-name> <WIM file> <image-id>

------------------------------------------

### Ubuntu PE Desktop for Remote Internet:
(Default VNC password: 123456, and you can update it via 'vncpasswd' command inside VNC X session)

```sh
# Download/Update latest Ubuntu image
docker pull ghostplant/flashback

# Boot Service: Using web browser to login - http://localhost:8443/
docker run -it --rm -p 8443:8443 -v /external:/root ghostplant/flashback

# Other Example 1 - Language: Set locale to en_US.UTF-8
docker run -it --rm -e LANG=en_US.UTF-8 -p 8443:8443 -p 5901:5901 -v /external:/root ghostplant/flashback

# Other Example 2 - Resolution Size : Set display resolution to 1366x768
docker run -it --rm -e GEOMETRY=1366x768 -p 8443:8443 -p 5901:5901 -v /external:/root ghostplant/flashback

# Other Example 3 - Initial Password: Set initial VNC password (length of password must be between 6 to 8).
docker run -it --rm -e INIT_PASS=123456 -p 8443:8443 -p 5901:5901 -v /external:/root ghostplant/flashback

# Other Example 4 - Resolution Quality: Using 24-bit high resolution quality (Only recommended in high-bandwidth network)
docker run -it --rm -e INIT_PASS=123456 -e DEPTH=24 -p 8443:8443 -p 5901:5901 -v /external:/root ghostplant/flashback
```

Then use Firefox/Chrome to login if you expose port 8443:

```sh
HTTP: x-www-browser http://localhost:8443/

HTTPS: x-www-browser https://localhost:8443/
```

------------------------------------------

## Reporting Issues

You can post issues here for any suggestions to improve Ubuntu Classic Desktop. To report a new issue, you are supposed to have a GitHub account and log in with it in the first place. Then, get access to [new issue](https://github.com/ghostplant/ubuntu-classic/issues/new), fill in the block with what you want to report, and finally submit this issue.

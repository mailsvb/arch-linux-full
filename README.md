### Arch Linux
![](https://sources.archlinux.org/other/artwork/archlinux-logo-dark-90dpi.png)

Arch Linux is an independently developed, x86-64 general-purpose GNU/Linux distribution that strives to provide the latest stable versions of most software by following a rolling-release model, allowing for a one-time install with continuous upgrades. The default installation is a minimal base system, configured by the user to only add what is required for his purposes.

### Image Build Process
This image is built based on the official Arch Linux Docker image [archlinux/base](https://hub.docker.com/r/archlinux/base) with a few modifications. Below is a list of modifications
* core, extra, community, multilib repositories added
* pacman mirrorlist containing https servers from AT, DE, NO, SE, CH, NL only

### Usage
```
docker pull mailsvb/arch-linux-full:latest
docker run --rm -it mailsvb/arch-linux-full:latest
```

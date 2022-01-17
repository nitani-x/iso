# ArchLan Linux ISO source

<p align="center">
<a href="https://archlan.github.io"><img src="https://raw.githubusercontent.com/archlan/assets/main/img/logo/128x128_logo.svg" height="128" width="128" alt="ArchLan"></a>
</p>


<p align="center">
  <img src="https://img.shields.io/badge/Released%3F-BETA-pink?style=social">
  <img src="https://img.shields.io/github/downloads/archlan/releases/total?style=social">
  <img src="https://img.shields.io/github/stars/archlan/iso?style=social">
  <img src="https://img.shields.io/github/issues/archlan/issue-tracker?color=purple&style=social">
</p>

<p align="center">
<a href="https://www.archlinux.org">Arch</a> based distribution. Designed for fun and minimalism.
</p>

## ArchLan Linux ISO

To build an ISO from these files:

```bash
$ cd iso
```

```bash
$ sudo ./mkarchiso -v "."
```

Once the command is complete, the ArchLan built ISO file should be located inside the `out` directory.

# Caution
Everything in this ISO is supposed to work properly, even though it is still in **BETA** state, which means that things such as global theming or status bar might not completely work yet.
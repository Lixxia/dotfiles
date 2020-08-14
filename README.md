Dotfiles
========

Ansible Playbook used to setup personal Ubuntu laptop.

Overview
========

*WM:* i3-gaps

*Editor:* vim

*Bar:* polybar

*Browser:* Firefox

*Terminal:* kitty

*Shell:* bash

*Notifications:* dunst

*Screen Locker:* i3lock

Screenshots
===========

![img](/ubuntu_screenshot.png?raw=true)


Roles
=====

<table>
  <thead>
    <tr>
      <th align="left" width="200">Name</th>
      <th align="left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><a href="roles/bash">bash</a></td>
      <td>Sets up bash dotfiles.</td>
    </tr>
    <tr>
      <td><a href="roles/dunst">dunst</a></td>
      <td>Installs <a href="https://github.com/dunst-project/dunst">dunst</a> for notifications.</td>
    </tr>
    <tr>
      <td><a href="roles/firefox">firefox</a></td>
      <td>Sets up firefox and customized <a href="https://github.com/Lixxia/MaterialFox">MaterialFox</a> theme. Contains a few manual items for addons.</td>
    </tr>
    <tr>
      <td><a href="roles/fonts">fonts</a></td>
      <td>Installs <a href="https://typeof.net/Iosevka/">Iosevka</a> Nerdfont and FontAwesome.</td>
    </tr>
    <tr>
      <td><a href="roles/gtk">gtk</a></td>
      <td>Setup of custom gtk theme and icons.</td>
    </tr>
    <tr>
      <td><a href="roles/i3">i3</a></td>
      <td>Setup <a href="https://github.com/Airblader/i3">i3</a> and desktop dependencies.</td>
    </tr>
    <tr>
      <td><a href="roles/i3lock">i3lock</a></td>
      <td>Setup <a href="https://github.com/Lixxia/i3lock/">i3lock</a> and auto-run on laptop shut service.</td>
    </tr>
    <tr>
      <td><a href="roles/kitty">kitty</a></td>
      <td>Setup another baby fork of <a href="https://sw.kovidgoyal.net/kitty/index.html">kitty</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/picom">picom</a></td>
      <td>Setup <a href="https://github.com/sdhand/picom">picom</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/polybar">polybar</a></td>
      <td>Setup <a href="https://github.com/polybar/polybar">polybar</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/rofi">rofi</a></td>
      <td>Setup <a href="https://github.com/davatorium/rofi">rofi</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/spotify">spotify</a></td>
      <td>Install spotify and theme with <a href="https://github.com/khanhas/spicetify-cli">spicetify</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/touchpad">touchpad</a></td>
      <td>Touchpad tweaks to make it usable.</td>
    </tr>
    <tr>
      <td><a href="roles/vim">vim</a></td>
      <td>Setup <a href="https://www.vim.org/">vim</a>.</td>
    </tr>
    <tr>
      <td><a href="roles/x">x</a></td>
      <td>Setup a few Xresources/colors that are referenced elsewhere.</td>
    </tr>
  </tbody>
</table>

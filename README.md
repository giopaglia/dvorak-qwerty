Dvorak-qwerty installation patch for Linux (XKB, X11)
------

![](https://github.com/FireSterLine/dvorak-qwerty/blob/master/dvorak-qwerty.png)

This patch allows you to use dvorak layouts with qwerty keybindings/shortcuts.
It installs new dvorak layouts, where any key will work as qwerty when pressed with Control, Alt or Super.

This eases the learning curve for beginner dvorakers.

Compared to the [original project](https://github.com/ZeptByteS/dvorak-qwerty), the installation process here has been made *safer*.
Currently, the original installation process performs a "hard" file overwriting, which forces a user to
give up new features of XKB. Instead, the installation process here just applies a diff-patch,
which is comparatively safer and makes this feature "timeless".
Note that the original project also has a more advanced feature, which I didn't bother to test here.
If interested, visit the [original develop branch](https://github.com/ZeptByteS/dvorak-qwerty/tree/develop).


Installation
------

```bash
git clone https://github.com/FireSterLine/dvorak-qwerty.git
cd dvorak-qwerty
sudo ./install.sh
```

This will save your xkb configuration (default path: `/usr/share/X11/xkb`) in an archive named xkb-backup-\*.tar.gz, and will apply a patch containing the new configuration files.

Next, the following new keyboard layouts will be available:


+ Dvorak-Qwerty
+ Dvorak-Qwerty simplified (no dead keys)
+ Dvorak-Qwerty, international with dead keys
+ Dvorak-Qwerty alternative international no dead keys
+ Dvorak-Qwerty, classic
+ Dvorak-Qwerty, programmer

You can select them via `setxkbmap` (or your Desktop Evironment settings).

Issues with Gnome
------

Gnome may override some keys in some cases that existed in other levels that did not interfere in previous configurations.

You can clear these bindings with the help of dconf-editor.

Steps:

1. Install dconf-editor for your distro

2. Open dconf-editor

3. Browse through /org/gnome/desktop/input-sources and find xkb-options.

4. Remove from the string the record that overrides your keymap


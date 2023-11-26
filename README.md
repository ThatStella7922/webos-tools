# webos-tools

Full documentation TBA, but for now:

- Brings a full `bash` to your TV, not ash from busybox
- Nondestructive and easily removable, installs to /home/root/webos-tools
- Tested on an LG C1 48" running webOS 6.3.2

To install, run the following while ssh'd into your LG TV as root:

```sh
curl -L -o /tmp/install.sh https://github.com/ThatStella7922/webos-tools/raw/master/install.sh && sh /tmp/install.sh
```

To remove, run the following:

```sh
curl -L -o /tmp/uninstall.sh https://github.com/ThatStella7922/webos-tools/raw/master/uninstall.sh && sh /tmp/uninstall.sh
```

TODO:

- Fix the spawned bash losing some terminal interactivity
  - Not sure why this happens, also causes ncurses-dependent programs like nano to fail
- Fix neofetch using the system provided bash (which resolves to busybox), therefore failing
  - Can fix by removing the shebang from neofetch
- Add more programs
# toolbox-launcher

Common Lisp UI to run a graphical application using `toolbox run` from a single desktop launcher.  
I use this to decide on which toolbox to launch GUI Emacs in Fedora Silverblue.

## Installation

You can compile your own version with the included `build.sh` script. You need SBCL with Quicklisp, and also Tcl and Tk.

Included in the "binary" directory is a pre-packaged Tcl+Tk downloaded from http://kitcreator.rkeene.org/kitcreator (the executable renamed from `tclkit` to `wish`) and `toolbox-launcher`. You can drop both files to `~/.local/bin` to use them in the base Silverblue system.

## Usage

Calling "toolbox-launcher" with no parameters opens a small window to select the container and type a command:

![window](/images/window.png)

The list of containers is obtained from parsing the output of `toolbox list -c`:

![containers](/images/containers.png)

You can pre-fill the values by using arguments in the call. The first argument is the container name, and the rest are used to fill the command, for example `toolbox-launcher fedora-toolbox-34 emacs -Q`:

![arguments](/images/arguments.png)

The "Execute" button is the default action, you can just press Enter.

My Emacs.desktop file is:

```
[Desktop Entry]
Name=Emacs
GenericName=Text Editor
Comment=Edit text
MimeType=text/english;text/plain;text/x-makefile;text/x-c++hdr;text/x-c++src;text/x-chdr;text/x-csrc;text/x-java;text/x-moc;text/x-pascal;text/x-tcl;text/x-tex;application/x-shellscript;text/x-c;text/x-c++;
Exec=toolbox-launcher fedora-toolbox-34 emacs %F
Icon=/var/home/hoagie/.local/share/icons/hicolor/scalable/apps/emacs.svg
Type=Application
Terminal=false
Categories=Development;TextEditor;
StartupWMClass=Emacs
Keywords=Text;Editor;
```

In the Gnome launcher it shows the regular icon, but instead uses this tiny window to pick the container to use.

## Rationale

I wanted to practice Common Lisp. That's all there is to it, because really this isn't that useful.

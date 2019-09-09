# lisp-game-editor

Editor for easy game development with Common Lisp

# Description

Auxiliary tool for smooth game development with Common Lisp and SDL2.

# Requirement

* [SDL2](https://www.libsdl.org/download-2.0.php)
* [Roswell](https://github.com/roswell/roswell)
* [Qlot](https://github.com/fukamachi/qlot)

# Preparation

## Install SDL2 Library

```
$ sudo apt install libsdl2-dev
$ sudo apt install libsdl2-gfx-dev
$ sudo apt install libsdl2-image-dev
$ sudo apt install libsdl2-mixer-dev
$ sudo apt install libsdl2-ttf-dev
```

## Install Roswell

Install with reference to [here](https://github.com/roswell/roswell#installation-dependency--usage)

## Install SDL2 Wrapper for Common Lisp

```
$ ros install lispgames/cl-sdl2
$ ros install Zulu-Inuoe/cl-sdl2-gfx
```

## Install libffi

```
$ sudo apt install libffi-dev
```

## Install Qlot

```
$ ros install qlot
```

## Setting Text Editor

Assume that you use Emacs or [Lem](https://github.com/cxxxr/lem)

### Emacs

Edit `~/.emacs.d/init.el`

```
(defun slime-qlot-exec (directory)
  (interactive (list (read-directory-name "Project directory: ")))
  (slime-start :program "qlot"
               :program-args '("exec" "ros" "-S" "." "run")
               :directory directory
               :name 'qlot
               :env (list (concat "PATH=" (mapconcat 'identity exec-path ":")))))
```

### Lem

Edit `~/.lem/init.lisp`

```
(define-command slime-qlot-exec (directory)
  ((list (prompt-for-directory "Project directory: " (buffer-directory))))
  (change-directory directory)
  (lem-lisp-mode:run-slime (lem-lisp-mode::get-lisp-command :prefix "qlot exec ")))
```

# Installation

```
$ ros install fireflower0/lisp-game-editor
```

# Usage

## Make project

```
lisp-game-editor new <project name>
```

## Edit program

Edit `app.lisp`

## Run program

Run REPL `M-x slime-qlot-exec`

```
(ql:quickload :<project name>)
(<project name>:start)
```

# Author

fireflower0

# License

MIT

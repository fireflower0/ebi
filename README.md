# Ebi

Framework that supports Game development using SDL2 in Common Lisp.

## Requirement

* [SDL2](https://www.libsdl.org/download-2.0.php)
* [Roswell](https://github.com/roswell/roswell)
* [Qlot](https://github.com/fukamachi/qlot)

## Preparation

### Install SDL2 Library

```
$ sudo apt install libsdl2-dev libsdl2-gfx-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev
```

### Install Roswell

Install with reference to [here](https://github.com/roswell/roswell#installation-dependency--usage)

### Install libffi

```
$ sudo apt install libffi-dev
```

### Install Qlot

```
$ ros install qlot
```

### Setting Text Editor

Assume that you use Emacs or [Lem](https://github.com/cxxxr/lem)

#### Emacs

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

#### Lem

Edit `~/.lem/init.lisp`

```
(define-command slime-qlot-exec (directory)
  ((list (prompt-for-directory "Project directory: " (buffer-directory))))
  (change-directory directory)
  (lem-lisp-mode:run-slime (lem-lisp-mode::get-lisp-command :prefix "qlot exec ")))
```

## Installation

```
$ ros install fireflower0/ebi
```

## Usage

### Make project

```
$ ebi new <project name>
```

### Edit program

Edit `app.lisp`

### Run program

The program can be run in two ways.

#### Slime REPL

Run REPL `M-x slime-qlot-exec`

```
(ql:quickload :<project name>)
(<project name>:start)
```

#### Roswell Script

Can also use Roswell Script as follows

```
$ qlot exec ros roswell/<project name>.ros
```

## Author

fireflower0

## License

MIT

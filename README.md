[![Slack Room][slack-badge]][slack-link]

# [fish-shell] cookbook

Tips and recipes for fish, from shell to plate.

## Introduction

Well-known shells are bash, ash, csh, ksh and the popular zsh. All these shells are [POSIX], so well-written POSIX-compliant scripts will run without little or no modifications in any of them.

fish is not quite a POSIX shell. Your bash scripts will \*not\* run in fish without modification. This is not a problem for most users that have learned the fish script syntax, but newcomers may find this behavior inconvenient.

```sh
make && make install
```

will cause fish to error with: "Unsupported use of '&&'. In fish, please use 'COMMAND; and COMMAND'."

```fish
make; and make install
```

It's the fish way. Why? Read the [fish design document](http://fishshell.com/docs/current/design.html) to find the answer.

## Table of Contents

* [Getting fish](#getting-fish)
* [Getting help](#getting-help)
* [What's up with all the wiggly symbols?](#whats-up-with-all-the-wiggly-symbols)
* [Finding your current location](#finding-your-current-location)
* [Check if a command is available](#check-if-a-command-is-available)
* [Find and run commands](#find-and-run-commands)
* [Get information about file](get#information#about#file)

### Getting fish

fish is not the default shell of any \*nix distribution yet, so you need to download and install it yourself. You can find directions in the official [website](https://fishshell.com), but if you are impatient, try this:

[homebrew]: http://brew.sh

#### OS X with [homebrew]

```bash
brew install fish
```

#### Debian

```bash
wget http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key
apt-key add - < Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```

#### Ubuntu

```bash
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
```

#### CentOS

```bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish
```

#### Fedora

```bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_23/shells:fish:release:2.repo
yum install fish
```

#### Arch Linux

```bash
pacman -S fish
```

#### Gentoo

```bash
emerge fish
```

#### From source

```bash
sudo apt-get -y install git gettext automake autoconf ncurses-dev build-essential libncurses5-dev

git clone -q --depth 1 https://github.com/fish-shell/fish-shell
cd fish-shell
autoreconf && ./configure
make && sudo make install
```

Once you have downloaded fish and put it somewhere in your $PATH like /usr/local/bin, you can make it your default login shell.

```fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

### Getting help

[`help`]: http://fishshell.com/docs/current/commands.html#help

The fastest way to get help about a fish builtin or topic, is via the [`help`] command.

```
help help
```

opens a page using your default browser and access the help documentation about the `help` command offline.

fish also includes man pages for all of its utilities.

```
man fish
```

shows the man page for the `fish` program itself.

### What's up with all the wiggly symbols?

![1](https://cloud.githubusercontent.com/assets/8317250/15318202/0287251a-1c60-11e6-9966-ca1249b880fe.png)

The tilde \`~' is an abbreviation of the [home directory](http://www.linfo.org/home_directory.html), for example /users/bucaran/home, /Users/bucaran, etc. It depends on your OS.

The \`[@](https://en.wikipedia.org/wiki/At_sign)' means _at_. I can see *bucaran*, my user, is logged into/at *mbp*, my computer name. Quite useful when you are logged into 5 different remote terminals, all with a different username.

The forward slash \`/' is the path delimiter. At a glance, I can see the current directory is in the vicinity of ~ (home), somewhere inside *s/fish-handbook*. The *s* is the first letter of the parent directory, *src* in my case.

As of fish >=2.3, you can customize the length of the abbreviated path:

```fish
set fish_prompt_pwd_dir_length NUMBER
```

or

```fish
set fish_prompt_pwd_dir_length 0
```

to do without abbreviations.

![2](https://cloud.githubusercontent.com/assets/8317250/15318203/02888f22-1c60-11e6-8210-8fca1f350968.png)

The greater than symbol \`>' seems to indicate the end of the prompt here.

* Learn more about [characters](http://www.linfo.org/character.html) in Unix.

### Finding your current location

You can find out where you are via the environment variable $PWD.

```fish
echo $PWD
/Users/bucaran/src/cookbook
```

Another way to retrieve the current directory is via the `pwd` builtin function.

```fish
pwd
/Users/bucaran/src/cookbook
```

In fish, both $PWD and `pwd` always resolve symbolic links. This means that, if you are inside a directory that is a symbolic reference to another directory, you always get the path to "another directory".

In fish, $PWD is also a read-only variable:

```
set PWD foo
```

errors with "set: Tried to change the read-only variable 'PWD'". So, I assume it's safe and easier to use in scripting instead of the arguably more expensive `pwd` function call.

### Check if a command is available

> See also [Find and run commands](#find-and-run-commands).

[`type`]: http://fishshell.com/docs/current/commands.html#type
[`builtin`]: http://fishshell.com/docs/current/commands.html#builtin
[`functions`]: http://fishshell.com/docs/current/commands.html#functions
[`command`]: http://fishshell.com/docs/current/commands.html#command

Use [`type`] to query information about existing commands, builtins or functions.

```fish
if not type --quiet "$command_name"
    echo "'$command_name' is not a valid command."
    exit 1
end
```

Sometimes you know the command type in advance. Then, you may prefer one of the following alternatives.

* [`builtin`] for fish builtins:
```fish
if not contains -- "$command_name" (builtin --names)
    exit
end
```

* [`command`] for regular external commands / binaries:
```fish
if not command --search "$command_name" > /dev/null
    exit 1
end
```

* [`functions`] for user defined functions:
```fish
if not functions --query "$command_name"
    exit
end
```

### Find and run commands

> See also [Check if a command is available](#check-if-a-command-is-available).

To run a command type the name of the command and press return.

```
ls
```

If you know at least the first letter of the command you are looking for, type it and press tab. fish will display a pager you can browse to select the command interactively.

![3](https://cloud.githubusercontent.com/assets/8317250/15318204/0288cc9e-1c60-11e6-8c8f-afe468bd41bc.png)

fish knows what names to treat as commands by looking at the PATH environment variable. This variable contains a list of paths, and every binary file inside any of those paths can be run directly by its name.

Print your PATH contents.

```
printf "%s\n" $PATH
/usr/local/bin
/usr/bin
/bin
```

or list every command in your system and display them in columns.

```
ls $PATH | column
```

If the list is truncated, use:

```
ls $PATH | column | less
```

Use `k` and `j` to navigate the list down / up, and `q` to exit.

The PATH variable is created at the start of the fish process during the environment initialization. You can later modify, prepend or append to this variable yourself, e.g, in your config.fish.

[`which`]: http://www.computerhope.com/unix/uwhich.htm
[`apropos`]: http://www.computerhope.com/unix/apropos.htm
[`whatis`]: http://www.computerhope.com/unix/whatis.htm

Similar to the [`type`], [`builtin`] and [`functions`] builtins, \*nix systems often include one or more shell-agnostic alternatives, e.g, [`which`], [`apropos`], [`whatis`], etc. These commands overlap in functionality, but also display unique features. Consult your system's manpage for details.

### Get information about file

...

<h1></h1>

Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/) by [Jorge Bucaran](https://github.com/bucaran).

Inspired by O'Reilly's [bash cookbook](http://shop.oreilly.com/product/9780596526788.do).

<!-- Links -->

[fish]: https://github.com/fish-shell/fish-shell
[fish-shell]: https://github.com/fish-shell/fish-shell
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[POSIX]: https://en.wikipedia.org/wiki/POSIX

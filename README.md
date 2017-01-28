[![Slack Room](https://fisherman-wharf.herokuapp.com/badge.svg)](https://fisherman-wharf.herokuapp.com)

# [fish-shell](https://github.com/fish-shell/fish-shell) cookbook

Comprehensive. Friendly. Indispensable. With more than enough simple and delicious recipes. Low in fat, versatile, and healthful. Enjoy!

## Table of Contents

* [Introduction](#introduction)
* [Setup](#setup)
    * [Installing fish](#installing-fish)
    * [Make fish your default shell](#make-fish-your-default-shell)
* [Getting help](#getting-help)


## Introduction

Well-known shells are bash, ash, csh, ksh and the popular zsh. All these shells are [POSIX](https://en.wikipedia.org/wiki/POSIX), so well-written POSIX-compliant scripts should run without modification in any of them. That's about the only good reason to learn POSIX shell.

fish is not a POSIX shell. Your bash scripts will **not** run in fish without some modification.

```sh
make && make install
```

will cause fish to error with: "Unsupported use of '&&'. In fish, please use 'COMMAND; and COMMAND'."

That's simple enough.

```fish
make; and make install
```

Check out the [fish design document](http://fishshell.com/docs/current/design.html) to understand fish design principles.

Here is a quote from the same document:

> Fish should be user friendly, but not at the expense of expressiveness. Most tradeoffs between power and ease of use can be avoided with careful design.

## Setup

### Installing fish

AFIK fish is not the default shell of any \*nix distribution, so you need to download and install it yourself. You can find directions in the official [website](https://fishshell.com) or follow the directions provided here for your OS.

<details>
<summary>macOS with homebrew</summary>

```bash
brew update && brew install fish
```
</details>

<details>
<summary>Debian</summary>

```bash
wget http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key
apt-key add - < Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```
</details>


<details>
<summary>Ubuntu</summary>

```bash
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
```
</details>

<details>
<summary>CentOS</summary>


```bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish
```
</details>

<details>
<summary>Fedora</summary>


```bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/Fedora_23/shells:fish:release:2.repo
yum install fish
```
</details>


<details>
<summary>Arch Linux</summary>

```bash
pacman -S fish
```
</details>


<details>
<summary>Gentoo</summary>

```bash
emerge fish
```
</details>

<details>
<summary>From source</summary>

```bash
sudo apt-get -y install git gettext automake autoconf ncurses-dev build-essential libncurses5-dev

git clone -q --depth 1 https://github.com/fish-shell/fish-shell
cd fish-shell
autoreconf && ./configure
make && sudo make install
```
</details>

### Make fish your default shell

Once you have installed fish and it's somewhere in your `$PATH`, e.g. /usr/local/bin, you can make it your default login shell.

```fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

> If you don't make fish your default shell, you'll need to run `fish` at the start of every shell session.

## Getting help

The official documentation includes a tutorial and

The fastest way to get help about a fish builtin or topic, is via the [`help`](http://fishshell.com/docs/current/commands.html#help) command.

```
help function
```

access the offline help documentation for the `function` builtin using your default browser.

fish also includes man pages for all of its utilities.

```
man function
```

displays the man page for the `function` builtin.






Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)

<!-- Links -->





<details>
<summary></summary>
</details>
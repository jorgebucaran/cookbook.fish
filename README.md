# [fish-shell](https://github.com/fish-shell/fish-shell) cookbook

[![Slack Room](https://fisherman-wharf.herokuapp.com/badge.svg)](https://fisherman-wharf.herokuapp.com)

This document is a living book of recipes to solve particular programming problems using fish-shell. Whether you are in the mood for mackerel or salmon on the grill, there is always a distinctive and delicious way to prepare any type of fish.

## Table of Contents
* [Introduction](#introduction)
* [Setup](#setup)
  * [How to install fish?](#how-to-install-fish)
  * [How to make fish my default shell?](#how-to-make-fish-my-default-shell)
  * [How to learn fish?](#how-to-learn-fish)
  * [Where to ask for help?](#where-to-ask-for-help)

## Introduction
Well-known shells are bash, ash, csh, ksh and the popular zsh. All these shells are [POSIX](https://en.wikipedia.org/wiki/POSIX), so well-written POSIX-compliant scripts should run without modification in any of them. That's about the only good reason to learn POSIX shell.

fish is not a POSIX shell. Your bash scripts will **not** run in fish without some modification.

```sh
make && make install
```

will error with: "Unsupported use of '&&'. In fish, please use 'COMMAND; and COMMAND'."

That's easy to fix.

```fish
make; and make install
```

Here is a quote from the [fish design document](http://fishshell.com/docs/current/design.html):

> Fish should be user friendly, but not at the expense of expressiveness. Most tradeoffs between power and ease of use can be avoided with careful design.

## Setup
### How to install fish?

You can find directions in the official [website](https://fishshell.com) or follow the directions provided here for your OS.

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

### How to make fish my default shell?
Once you have installed fish and it's somewhere in your `$PATH`, e.g. /usr/local/bin, you can make it your default login shell.

> If you don't make fish your default shell, you'll need to run `fish` at the start of every shell session.

```fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

If you are not sure about the location where fish is installed, use `which` to find out.

```fish
which fish
```

### How to learn fish?
The best way to learn fish is to read the official [documentation](http://fishshell.com/docs/current/index.html) and [tutorial](http://fishshell.com/docs/current/tutorial.html).

### Where to ask for help?
* Use the [`help`](http://fishshell.com/docs/current/commands.html#help) builtin.
* [Subreddit](https://www.reddit.com/r/fishshell/)
* [Gitter Channel](https://gitter.im/fish-shell/fish-shell).
* [StackOverflow](http://stackoverflow.com/questions/tagged/fish).
* [Fisherman Slack](https://fisherman-wharf.herokuapp.com)


Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)


<!--
<details>
<summary>Template</summary>
</details>
-->

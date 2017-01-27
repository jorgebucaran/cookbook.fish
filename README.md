[![Slack Room][slack-badge]][slack-link]

# [fish-shell] cookbook

Comprehensive. Friendly. Indispensable. With more than enough simple and delicious recipes. Low in fat, versatile, and healthful.

## Table of Contents

* [Introduction](#introduction)
* [Setup](#setup)
    * [Installing fish](#installing-fish)
    * [Make fish your default shell](#make-fish-your-default-shell)
* [Getting help](#getting-help)
* [Modes and Stuff](#modes-and-stuff)
    * [Login shell](#login-shell)
    * [Interactive and non-interactive shell](#interactive-and-non-interactive-shell)


## Introduction

Well-known shells are bash, ash, csh, ksh and the popular zsh. All these shells are [POSIX], so well-written POSIX-compliant scripts should run without modification in any of them. That's about the only good reason to learn POSIX shell.

fish is not quite a POSIX shell. Your bash scripts will **not** run in fish without modification.

```sh
make && make install
```

will cause fish to error with: "Unsupported use of '&&'. In fish, please use 'COMMAND; and COMMAND'."

```fish
make; and make install
```

It's fishy. Why? Read the [fish design document](http://fishshell.com/docs/current/design.html) to understand the decisions behding fish design.

## Setup

### Installing fish

AFIK fish is not the default shell of any \*nix distribution, so you need to download and install it yourself. You can find directions in the official [website](https://fishshell.com), but here you go:

<details>
<summary>macOS with Homebrew</summary>

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

Once you have downloaded fish and put it somewhere in your `$PATH` like /usr/local/bin, make it your default login shell.

```fish
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

<details>
<summary>Why?</summary>

> If you don't make fish your default shell, you'll have to run `fish` at the start of your default shell (sh, ash, bash, etc.) everytime you create a new session or open a new terminal window / tab.
</details>

## Getting help

[`help`]: http://fishshell.com/docs/current/commands.html#help

The fastest way to get help about a fish builtin or topic, is via the [`help`] command.

```
help function
```

access the offline help documentation for the `function` builtin using your default browser.

fish also includes man pages for all of its utilities.

```
man function
```

displays the man page for the `function` builtin.


## Modes and Stuff

When you begin a new fish session, you are greeted like so:

```
Welcome to fish, the friendly interactive shell
```

> **Tip**: To get rid of this message, run only once `set -U fish_greeting`. See [Universal variables](#universal-variables) to learn more.

You are running fish in interactive mode. As it turns out, shells have modes.

fish supports login, interactive and non-interactive shells. After [making fish your default shell](#make-fish-your-default-shell), you'll get a login and interactive shell on every new terminal by default.

[REPL]: https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop

An interactive shell is what you'd expect if you didn't care about such things as shell modes. It's like a fancy [REPL] session.

### Login shell

To run a command only when using a login shell:

```fish
if status --is-login
    echo "Annoying generic message."
end
```

If you put that inside `~/.config/fish/config.fish` you'll see that message every time you create a new session, but you won't when creating a sub shell, e.g. running `fish` inside the current session.

But why would you run `fish` inside the current session? Well, it has its uses. During an interactive session (more on interactive sessions later), you could create a sub shell to start a clean environment, try a few commands and eventually exit and return to the original session.

### Interactive and non-interactive shell

If you want to run a command only on starting an interactive shell, use:

```fish
if status --is-interactive
    echo "We live in an interactive world!"
end
```

If you put that inside `~/.config/fish/config.fish` you'll see that message at the start of every session as well as for sub shells.

Surely, you ask, if there are interactive shells, that means there must be non-interactive shells too. That's not a question, but yes, non-interactive shells are a thing too and in fact, they are very common.

For starters, there is no user input in non-interactive shells. When you run fish with a command or file to execute, like so:

```fish
fish -c "sleep 1"
```

or

```fish
fish ./my_script.fish
```

That's a non interactive shell. You can verify this is so running:

```fish
fish -c "status --is-interactive"
```

which should set the special `$status` variable to 1.

```fish
echo $status
```


If this is not immediately useful to you, don't worry, but here is a use case.

Your fish configuration in ~/.config/fish/config.fish is slowing down your shell start. There are usually a few other ways to counteract this (see [Function Autoloading](#function-autoloading)), but depending on the situation, you could use `status --is-login` or `status --is-interactive` to speed up the starting of non-login or non-interactive shells respectively.

```fish
if status --is-interactive
    # Bottleneck / Slow code
end
```

This won't fix the slow session start, but at least it won't make non-interactive sub shells just as slow.



Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)

<!-- Links -->

[fish]: https://github.com/fish-shell/fish-shell
[fish-shell]: https://github.com/fish-shell/fish-shell
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[POSIX]: https://en.wikipedia.org/wiki/POSIX


<details>
<summary>TITLE</summary>
</details>
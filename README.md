# [fish-shell](https://github.com/fish-shell/fish-shell) cookbook

[![Slack Room](https://fisherman-wharf.herokuapp.com/badge.svg)](https://fisherman-wharf.herokuapp.com)

This document is a living book of recipes to solve particular programming problems using fish-shell. Whether you are in the mood for mackerel or salmon on the grill, there is always a distinctive and delicious way to prepare any type of fish.

## Table of Contents
* [Notes](#notes)
* [Introduction](#introduction)
* [Setup](#setup)
  * [How to install fish?](#how-to-install-fish)
  * [How to make fish my default shell?](#how-to-make-fish-my-default-shell)
  * [How to find out where fish is installed?](#how-to-find-out-where-fish-is-installed)
  * [How to learn fish?](#how-to-learn-fish)
  * [Where to ask for help?](#where-to-ask-for-help)
* [Functions](#functions)
    * [How to create a function in fish?](#how-to-create-a-function-in-fish)
    * [How to create a private function in fish?](#how-to-create-a-private-function-in-fish)
    * [Should function names and file names match?](#should-function-names-and-file-names-match)
    * [Can I define more than one function in a file?](#can-i-define-more-than-one-function-in-a-file)
* [Aliases](#aliases)
    * [How to define an alias in fish?](#how-to-define-an-alias-in-fish)
    * [What's wrong with aliases?](#whats-wrong-with-aliases)

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

```fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

### How to find out where fish is installed?

Use [`which`](https://linux.die.net/man/1/which).

<details>
<summary>Example</summary>

```fish
which fish
/usr/local/bin/fish
```
</details>

### How to learn fish?
The best way to learn fish is to read the official [documentation](http://fishshell.com/docs/current/index.html) and [tutorial](http://fishshell.com/docs/current/tutorial.html).

### Where to ask for help?
* [Gitter Channel](https://gitter.im/fish-shell/fish-shell)
* [StackOverflow](http://stackoverflow.com/questions/tagged/fish)
* [Subreddit](https://www.reddit.com/r/fishshell/)

## Functions
### How to create a function in fish?
Use the [`function`](http://fishshell.com/docs/current/commands.html#function) builtin.

```fish
function mkdirp
    mkdir -p $argv
end
```

To make this function available in future fish sessions save it to ~/.config/fish/functions/mkdirp.fish. A clean way to accomplish this is using the [`funcsave`](http://fishshell.com/docs/current/commands.html#funcsave) function.

```fish
funcsave mkdirp
```

Alternative, you can use the [`functions`](http://fishshell.com/docs/current/commands.html#functions) builtin to write the function definition to a file.

```fish
functions mkdirp > ~/.config/fish/functions/mkdirp.fish
```

### How to create a private function in fish?
[Fish does not have private functions](http://stackoverflow.com/a/27657662/2903889). Instead use a custom namespace to prefix a function you want to treat as private.

```fish
function _prefix_my_function

end
```

It's not impossible to simulate private functions in fish, but it requires a bit of hacking.

<details>
<summary>Example</summary>

```fish
function foo
    function _foo
        echo Foo
        functions -e _foo
    end
    _foo
end
```
</details>

### Should function names and file names match?
Yes. The [lazy-loading / autoloading](http://fishshell.com/docs/current/tutorial.html#tut_autoload) mechanism relies on this convention to work.

If you have a file ~/.config/fish/functions/foo.fish with a valid function definition `bar`:

1. In a new shell, trying to run `bar` produces an unknown-command error.
2. Typing `foo` will highlight as a valid command, but produce an unknown-command error.
3. Trying to run `bar` again now works as intended.

<details>
<summary>Example</summary>

Save `bar` to ~/.config/fish/functions/foo.fish.

```fish
function bar
    echo Bar
end
functions bar > ~/.config/fish/functions/foo.fish
```

Create a new shell session.

```
fish
```

Try to run bar, then foo, then bar again.

```
bar
# fish: Unknown command 'bar'
foo
# fish: Unknown command 'foo'
bar
# Bar
```
</details>

### Can I define more than one function in a file?
Yes, you can. Note that [fish does not have private functions](http://stackoverflow.com/a/27657662/2903889), so every function in the file ends up in the global scope when the file is loaded. Also, every function is eagerly loaded as well, which it's not as effective as using one function per file.

## Aliases
### How to define an alias in fish?

Create a [`function`](http://fishshell.com/docs/current/commands.html#function) and save it to ~/.config/fish/functions.

<details>
<summary>Example</summary>

```fish
function rimraf
    rm -rf $argv
end
```
</details>

For backwards compatibility with POSIX shells, use the [`alias`](http://fishshell.com/docs/current/commands.html#alias) function.

<details>
<summary>Example</summary>

```fish
alias rimraf "rm -rf"
```
</details>

Avoid using `alias` inside ~/.config/fish/config.fish. See the [next section](#whats-wrong-with-aliases).

### What's wrong with aliases?
Aliases created with `alias` will not be available in new shell sessions. If that's the behavior you need, then `alias` is acceptable for interactive use.

To persist aliases across shell sessions, create a [`function`](http://fishshell.com/docs/current/commands.html#function) and save it to ~/.config/fish/functions. This takes advantage of fish function [lazy-loading / autoloading](http://fishshell.com/docs/current/tutorial.html#tut_autoload) mechanism.

Using `alias` inside ~/.config/fish/config.fish will slow down your shell start as each alias/function will be eagerly loaded.


Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)


<!--
<details>
<summary>Template</summary>
</details>
-->

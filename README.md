[![Slack Room][slack-badge]][slack-link]

# [fish-shell] cookbook

Comprehensive. Friendly. Indispensable. With more than enough simple and delicious recipes. Low in fat, versatile, and healthful. Enjoy!

## Table of Contents

* [Introduction](#introduction)
* [Setup](#setup)
    * [Installing fish](#installing-fish)
    * [Make fish your default shell](#make-fish-your-default-shell)
* [Getting help](#getting-help)
* [What's up with all the wiggly symbols?](#whats-up-with-all-the-wiggly-symbols)
* [Finding your current location](#finding-your-current-location)
* [Shell modes](#shell-modes)
    * [Login shell](#login-shell)
    * [Interactive and non-interactive shell](#interactive-and-non-interactive-shell)
    * [Exit codes](#exit-codes)
* [Commands, functions and builtins](#commands-functions-and-builtins)
    * [Check if a command is available](#check-if-a-command-is-available)
    * [Find and run commands](#find-and-run-commands)
* [Autosuggestions](#autosuggestions)
* [Tab completions](#tab-completions)
* [Basic concepts](#basic-concepts)
    * [Comments](#comments)
        * [Shebang](#shebang)
    * [Variables](#variables)
        * [Local variables](#local-variables)
        * [Global variables](#global-variables)
        * [Exported variables](#exported-variables)
        * [Universal variables](#universal-variables)
    * [Lists](#lists)
    * [Functions](#functions)
    * [Conditionals](#conditionals)
    * [Loops](#loops)
    * [Command Substitutions](#command-substitutions)

## Introduction

Well-known shells are bash, ash, csh, ksh and the popular zsh. All these shells are [POSIX], so well-written POSIX-compliant scripts should run without modification in any of them. That's about the only good reason to learn POSIX shell.

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

AFIK fish is not the default shell of any \*nix distribution, so you need to download and install it yourself. You can find directions in the official [website](https://fishshell.com), but here you go:

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

## What's up with all the wiggly symbols?

Maybe your shell looks like this:

```
x@mbp ~/C/fish-shell>
```

The tilde `~` is an abbreviation of the [home directory](http://www.linfo.org/home_directory.html), for example /users/x/home, /Users/x, etc.

The `@` means at. I can see `x`, my user, is logged into `mbp`, which is the name I gave to my workstation.

The forward slash `/` is the path delimiter. At a glance, I can see the current directory is in the vicinity of `~`, somewhere inside C/fish-shell. The C is the first letter of the parent directory, Code in my case.


<details>
<summary>As of fish >=2.3, you can customize the length of the abbreviated path.</summary>

```fish
set fish_prompt_pwd_dir_length NUMBER
```
or
```fish
set fish_prompt_pwd_dir_length 0
```
for no abbreviations.

```
x@mbp ~/Code/fish-shell
```
</details>

The greater than symbol `>` is used here to indicate the end of the prompt.

You can customize all of this stuff. You don't like these conventions? Create your own prompt the way you like it. See [Rolling out your own prompt](#rolling-out-your-own-prompt).

## Finding your current location

You can find out where you are via the read-only environment variable `$PWD`.

```fish
echo $PWD
/Users/x/Code/fish-shell
```

Another way to find out the current directory is via the `pwd` builtin.

```fish
pwd
/Users/x/Code/fish-shell
```

In fish, both `$PWD` and `pwd` always resolve symbolic links. This means that, if you are inside a directory that is a symbolic reference to another, you always get the path to the real directory.

Interactively, `pwd` is easier to type. For scripting, `$PWD` is a function call less expensive.

<details>
<summary>Example</summary>

```fish
set -l cwd (pwd)
echo "The current working directory is: $cwd"

# Versus

echo "The current working directory is: $PWD"
```
</details>

## Shell modes

When you begin a new fish session, you are greeted like so:

```
Welcome to fish, the friendly interactive shell
```

> **Tip**: To get rid of this message, run `set -U fish_greeting`. See [Universal variables](#universal-variables) to learn more.

You are running fish in interactive mode. As it turns out, shells have modes.

fish supports login, interactive and non-interactive shells. After [making fish your default shell](#make-fish-your-default-shell), you'll get a login and interactive shell on every new terminal by default.

An interactive shell is what you'd expect if you didn't care about such things as shell modes. It's a fancy [REPL](https://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop) session.

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

If this is not immediately useful to you, don't worry, but here is a use case.

Your fish configuration in ~/.config/fish/config.fish is slowing down your shell start. There are usually a few other ways to counteract this (see [Function Autoloading](#function-autoloading)), but depending on the situation, you could use `status --is-login` or `status --is-interactive` to speed up the starting of non-login or non-interactive shells respectively.

```fish
if status --is-interactive
    # Bottleneck / Slow code
end
```

This won't fix a slow session start, but at least it won't make non-interactive sub shells just as slow.

### Exit codes

Every command returns an **exit code** to indicate whether they were succesful, or if they failed, how or why they failed. An exit code of 0 means success. Anything else means failure. Different commands use different codes to represent the different errors that can happen.

You can check the exit code of any command using the special, read-only variable `$status`.

```fish
false
echo $status
```

The [`false`](http://fishshell.com/docs/current/commands.html#false) builtin sets `$status` to 1, so the above should print 1. Similarly there is a [`true`](http://fishshell.com/docs/current/commands.html#true) builtin, which does the opposite of `false`, obviously.


## Commands, functions and builtins

In fish you are able to execute 3 different kind of things.


* System commands, e.g, [`fish`](http://fishshell.com/docs/current/commands.html#fish) (also: executable scripts, symbolic links to binaries, etc.).

* Functions defined by the user or default fish functions, e.g, [`eval`](http://fishshell.com/docs/current/commands.html#eval).

* Builtins provided by fish. Builtins behave like functions in that a builtin does not spawn a child process, but they are compiled into `fish`. This means they have access to environment variables. In contrast, a command usually runs as a child process and has only access to environment variables which have been exported.

### Check if a command is available

Use [`type`](http://fishshell.com/docs/current/commands.html#type) to query information about existing commands, builtins or functions.

```fish
if not type --quiet "$command_name"
    echo "'$command_name' is not a valid command."
    exit 1
end
```

Sometimes you know whether a command is a system command, builtin or function in advance.

<details>
<summary>Use <code><a href="http://fishshell.com/docs/current/commands.html#builtin">builtin</a></code> to check if a fish builtin exists:</summary>

```fish
if not contains -- "$command_name" (builtin --names)
    exit
end
```
</details>


<details>
<summary>Use <code><a href="http://fishshell.com/docs/current/commands.html#command">command</a></code> for system commands</summary>

```fish
if not command --search "$command_name" > /dev/null
    exit 1
end
```

Easier in fish >= 2.5

```fish
if not command --search --quiet "$command_name"
    exit 1
end

```

</details>


<details>
<summary>Use <code><a href="http://fishshell.com/docs/current/commands.html#function">function</a></code> for user defined functions</summary>

```fish
if not functions --query "$command_name"
    exit
end
```

</details>


### Find and run commands

I bet you already know this, but to run a command: type the name of the command and press return.


```
ls
```

Or, start typing the command you are looking for, and press tab. fish will use the builtin pager which you can browse and select the command interactively.

fish knows what commands are available by looking at the `$PATH` environment variable. This variable contains a list of paths, and every binary file inside any of those paths can be run by their name.

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

The `$PATH` variable is created at the start of the fish process during the environment initialization. You can  modify, prepend or append to this variable yourself, e.g, in ~/.config/fish/config.fish.

Similar to the `type`, `builtin` and `functions` builtins previously introduced, \*nix systems often include one or more shell-agnostic alternatives, e.g, `which`, `apropos`, `whatis`, etc. These commands overlap in functionality, but also possess unique features. Consult your system's manpage for details.


## Autosuggestions

REQUIRES GIF

## Tab completions

REQUIRES GIF

## Basic concepts
## Comments

Comments start with `#` and continue on to the end of the line. Comments are ignored by fish, so you use them to document your code.

### Shebang

There is a special type of comment known as the [shebang](https://en.wikipedia.org/wiki/Shebang_(Unix)) used to tell the operating system to run a program using the path of your script as an argument. The shebang is always written at the beginning of the script.

To run a script with `fish` use a shebang like so:

```fish
#!/usr/bin/env fish
```

<details>
<summary>Example</summary>

```fish
#!/usr/bin/env fish

if status --is-interactive
    echo "We live in an interactive world!"
end
```

Save that to a file and mark it as executable.

```fish
chmod +x my_script
```

The system above allow us to run the script directly by using its path

```fish
./my_script
```

instead of

```fish
fish my_script
```
</details>

## Variables

Variables in fish have no types and sport local, global, exported and universal scopes.

### Local variables
### Global variables
### Exported variables
### Universal variables




## Lists


## Functions


## Conditionals


## Loops


## Command




http://www.in-ulm.de/~mascheck/various/shebang/


Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)

<!-- Links -->

[fish]: https://github.com/fish-shell/fish-shell
[fish-shell]: https://github.com/fish-shell/fish-shell
[Fisherman]: https://github.com/fisherman/fisherman
[slack-link]: https://fisherman-wharf.herokuapp.com
[slack-badge]: https://fisherman-wharf.herokuapp.com/badge.svg
[POSIX]: https://en.wikipedia.org/wiki/POSIX


<details>
<summary>TITLE</summary>
</details>
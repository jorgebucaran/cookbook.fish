# [fish-shell](https://github.com/fish-shell/fish-shell) cookbook

[![Slack Room](https://fisherman-wharf.herokuapp.com/badge.svg)](https://fisherman-wharf.herokuapp.com)

This document is a living book of recipes to solve particular programming problems using fish-shell. Whether you are in the mood for mackerel or salmon on the grill, there is always a distinctive and delicious way to prepare any type of fish.

Licensed [CC BY-NC-SA 4.0](http://creativecommons.org/licenses/by-nc-sa/4.0/)

## Table of Contents

* [Introduction](#introduction)
* [Setup](#setup)
  * [How to install fish?](#how-to-install-fish)
  * [How to make fish my default shell?](#how-to-make-fish-my-default-shell)
  * [How to find out where fish is installed?](#how-to-find-out-where-fish-is-installed)
* [Getting Started](#getting-started)
  * [How to learn fish?](#how-to-learn-fish)
  * [Where to ask for help?](#where-to-ask-for-help)
  * [What's a prompt and what are all these ugly characters?](#whats-a-prompt-and-what-are-all-these-ugly-characters)
  * [How to find my current location in fish?](#how-to-find-my-current-location-in-fish)
  * [How to find and run commands in fish?](#how-to-find-and-run-commands-in-fish)
  * [How to check if a command succeeded in fish?](#how-to-check-if-a-command-succeeded-in-fish)
  * [What is the fish shebang?](#what-is-the-fish-shebang)
* [Configuration](#configuration)
  * [Where's the .bash_profile or .bashrc equivalent in fish?](#wheres-the-bash_profile-or-bashrc-equivalent-in-fish)
* [Variables](#variables)
  * [How to set environment variables in fish?](#how-to-set-environment-variables-in-fish)
  * [How to export a variable in fish?](#how-to-export-a-variable-in-fish)
  * [How to list all environment variables in fish?](#how-to-list-all-environment-variables-in-fish)
  * [How to set the `$PATH` persistently in fish?](#how-to-set-$PATH-persistently-in-fish)
  * [How to remove a path from the `$PATH` in fish?](#how-to-remove-a-path-from-$PATH-variable-in-fish)
  * [How to check if a path exists in the `$PATH` in fish?](#how-to-check-if-a-path-exists-in-the-$PATH-in-fish)
* [Functions](#functions)
  * [How to create a function in fish?](#how-to-create-a-function-in-fish)
  * [How to create a private function in fish?](#how-to-create-a-private-function-in-fish)
  * [Should function names and file names match?](#should-function-names-and-file-names-match)
  * [Can I define more than one function in a file?](#can-i-define-more-than-one-function-in-a-file)
  * [How to show the definition of a function in fish?](#how-to-show-the-definition-of-a-function-in-fish)
  * [What's the difference between functions, builtins and commands in fish?](#whats-the-difference-between-functions-builtins-and-commands-in-fish)
  * [How do I list the functions defined in fish?](#how-do-i-list-the-functions-defined-in-fish)
  * [How to check if a function exists in fish?](#how-to-check-if-a-function-exists-in-fish)
* [Arguments](#arguments)
  * [How to access the arguments passed to a function in fish?](#how-to-access-the-arguments-passed-to-a-function-in-fish)
  * [How to parse command line arguments in fish?](#how-to-parse-command-line-arguments-in-fish)
* [Aliases](#aliases)
  * [How to define an alias in fish?](#how-to-define-an-alias-in-fish)
  * [What's wrong with aliases?](#whats-wrong-with-aliases)
* [IO](#io)
  * [How to read from a file in fish?](#how-to-read-from-a-file-in-fish)
  * [How to read from stdin in fish?](#how-to-read-from-stdin-in-fish)
  * [How to redirect stdout or stderr to a file in fish?](#how-to-redirect-stdout-or-stderr-to-a-file-in-fish)
* [Concurrency](#concurrency)
  * [How to run a command in the background in fish?](#how-to-run-a-command-in-the-background-in-fish)
  * [How to check if there are background jobs running in fish?](#how-to-check-if-there-are-background-jobs-running-in-fish)
  * [How to synchronize two or more background tasks in fish?](#how-to-synchronize-two-or-more-background-tasks-in-fish)
  * [How to wait for a background process in fish?](#how-to-wait-for-a-background-process-in-fish)

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

```fish
which fish
/usr/local/bin/fish
```

## Getting Started

### How to learn fish?

The best way to learn fish is to read the official [documentation](http://fishshell.com/docs/current/index.html) and [tutorial](http://fishshell.com/docs/current/tutorial.html).

### Where to ask for help?

* [Gitter Channel](https://gitter.im/fish-shell/fish-shell)
* [StackOverflow](http://stackoverflow.com/questions/tagged/fish)
* [Subreddit](https://www.reddit.com/r/fishshell/)

### What's a prompt and what are all these ugly characters?

The prompt is where you type commands and interact with your shell interpreter, e.g, fish. Read more about the UNIX prompt [here](https://en.wikipedia.org/wiki/Command-line_interface#Command_prompt).

Maybe it looks like this:

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

You don't like these conventions? Create your own prompt the way you like it.

See [How to create my own prompt in fish?](#how-to-create-my-own-prompt-in-fish)

### How to find my current location in fish?

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

### How to find and run commands in fish?

To run a command type the name of the command and press return.

```fish
ls
```

Or, start typing the command you are looking for, and press tab. fish will use the builtin pager which you can browse and select the command interactively.

fish knows what commands are available by looking at the `$PATH` environment variable. This variable contains a list of paths, and every binary file inside any of those paths can be run by their name.

Print your `$PATH` contents.

```fish
printf "%s\n" $PATH
/usr/local/bin
/usr/bin
/bin
```

or list every command in your system and display them in columns.

```fish
ls $PATH | column
```

If the list is truncated, use:

```fish
ls $PATH | column | less
```

Use `k` and `j` to navigate the list down / up, and `q` to exit.

The `$PATH` variable is created at the start of the fish process during the environment initialization. You can modify, prepend or append to this variable yourself, e.g, in ~/.config/fish/config.fish.

Similar to the `type`, `builtin` and `functions` builtins previously introduced, \*nix systems often include one or more shell-agnostic alternatives, e.g, `which`, `apropos`, `whatis`, etc.

These commands overlap in functionality, but also possess unique features. Consult your system's manpage for details.

### How to check if a command succeeded in fish?

Every command returns an **exit code** to indicate whether they succeeded or not. An exit code of 0 means success. Anything else means failure. Different commands use different integers to represent the different errors that can happen.

You can check the exit code of any command using the special, read-only variable `$status`.

```fish
my_command
echo $status
```

### What is the fish shebang?

There is a special type of comment known as the [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>) used to tell the shell system to run a program using the path of your script as an argument. The shebang is always written at the beginning of the script.

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

### How to set environment variables in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin.

```fish
set foo 42
```

The `set` builtin accepts the following flags to explicitly declare the scope of the variable:

* `-l`, `--local`: available only to the innermost block
* `-g`, `--global`: available outside blocks and by other functions
* `-U`, `--universal`: shared between all fish sessions and persisted across restarts of the shell
* `-x`, `--export`: available to any child process spawned in the current session

If no scope modifier is used, the variable will be local to the current function, otherwise it will be global.

If the variable has already been defined, the previous scope will be used.

<details>
<summary>Local Variables</summary>

The variable `foo` will not be available outside the `if` block.

```fish
if true
    set -l foo 42
end

echo "foo=$foo" # foo=
```

</details>

<details>
<summary>Global Variables</summary>

The variable `foo` will be avaiable outside the `if` block.

```fish
if true
    set -g foo 42
end

echo "foo=$foo" # foo=42
```

</details>

<details>
<summary>Universal Variables</summary>

The variable `foo` will be preserved and available to future shell sessions.

```fish
set -U foo 42
fish
echo "foo=$foo" # foo=42
```

</details>

<details>
<summary>Exported Variables</summary>

The variable `foo` will be local and exported, therefore available to the `fish` child process created inside the `if` block.

```fish
if true
    set -lx foo 42
    fish -c 'echo "foo=$foo"' # foo=42
end
```

The variable `foo` will be global, but since it's not exported, it won't be available to the `fish` child process.

```fish
set -g foo 42
fish -c 'echo "foo=$foo"' # foo=
```

The variable `GPG_AGENT_INFO` will be universal and exported, therefore preserved across future shell sessions and child processes.

```fish
set -Ux GPG_AGENT_INFO /Users/x/.gnupg/S.gpg-agent:12345:2
```

</details>

### How to export a variable in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin and the scope modifier `-x` or `--export`.

```fish
set -x foo 42
fish -c 'echo "foo=$foo"' # foo=42
```

### How to list all environment variables in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin without any modifier flags.

```fish
set
```

To print only the variable names, without the values, use `--name`.

```fish
set --names
```

To not truncate long lines use `--long`.

```fish
set --long
```

### How to set the `$PATH` persistently in fish?

The correct way to persistently add a path to your `$PATH` is using fish `$fish_user_paths` variable.

```fish
set -U fish_user_paths $fish_user_paths my_path
```

See [`$PATH`](http://fishshell.com/docs/current/tutorial.html#tut_path) in the fish tutorial for more information.

### How to remove a path from the `$PATH` in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin with the `-e` or `--erase` flag in combination with the [`contains`](http://fishshell.com/docs/current/commands.html#contains) builtin to find the index of the path you want to remove.

```fish
if set -l index (contains -i $my_path $PATH)
    set -e PATH[$index]
end
```

### How to check if a path exists in the `$PATH` in fish?

Use the [`contains`](http://fishshell.com/docs/current/commands.html#contains) builtin.

```fish
if contains $my_path $PATH
    # $my_path is in $PATH
end
```

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

You can't. In fish, functions are always public.

As a workaround, use a custom namespace to prefix any function you want to treat as private.

```fish
function _prefix_my_function
end
```

It's not impossible to simulate private scope using [`functions -e`](http://fishshell.com/docs/current/commands.html#functions), however it's likely to perform poorly.

<details>
<summary>Example</summary>

```fish
function foo
    function _foo
        echo Foo
        functions -e _foo # Erase _foo
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

### How to show the definition of a function in fish?

If you know the command is a function, use the [`functions`](http://fishshell.com/docs/current/commands.html#functions) builtin.

```fish
functions my_function
```

If you are not sure whether the command is a function, a builtin or a system command, use [`type`](http://fishshell.com/docs/current/commands.html#type).

```fish
type fish
fish is /usr/local/bin/fish
```

### What's the difference between functions, builtins and commands in fish?

System commands are executable scripts, binaries or symbolic links to binaries present in your [`$PATH`](https://fishshell.com/docs/current/tutorial.html#tut_path) variable. A command runs as a child process and has only access to environment variables which have been exported. Example: `fish`.

Functions are used-defined. Some functions are included with your fish distribution. Example: [`eval`](http://fishshell.com/docs/current/commands.html#eval).

Builtins are commands compiled with the fish executable. Builtins have access to the environment, so they behave like functions. Builtins do not spawn a child process. Example: [`functions`](http://fishshell.com/docs/current/commands.html#functions).

### How do I list the functions defined in fish?

Use the [`functions`](http://fishshell.com/docs/current/commands.html#functions) builtin without arguments.

The list will omit functions whose name start with an underscore. Functions that start with an underscore are often called _hidden_. To show everything, use `functions -a` or `functions --all`.

Alternatively, launch the fish Web-based configuration and navigate to the /functions tab.

```
fish_config functions
```

### How to check if a function exists in fish?

Use the [`type`](http://fishshell.com/docs/current/commands.html#type) function to query information about commands, builtins or functions.

```fish
if not type --quiet "$command_name"
    exit 1
end
```

<details>
<summary>Use <code><a href="http://fishshell.com/docs/current/commands.html#builtin">builtin --names</a></code> to query builtins.</summary>

```fish
if not contains -- "$command_name" (builtin --names)
    exit 1
end
```

</details>

<details>
<summary>Use <code><a href="http://fishshell.com/docs/current/commands.html#functions">functions --query</a></code> to check if a function exists.</summary>

```fish
if not functions --query "$command_name"
    exit 1
end
```

</details>

<details>
<summary>Use <code><a href="http://fishshell.com/docs/current/commands.html#command">command --search</a></code> for other commands.</summary>

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

## Arguments

### How to access the arguments passed to a function in fish?

Use the `$argv` variable.

```fish
function Foo
    printf "%s\n" $argv
end

Foo foo bar baz
foo
bar
baz
```

### How to access the arguments passed to a script in fish?

Use the `$argv` variable. Pass the arguments when running the script.

```fish
fish ./my_script foo bar baz
foo
bar
baz
```

<details>
<summary>Example: my_script</summary>

```fish
#!/usr/bin/env fish
printf "%s\n" $argv
```

</details>

### How to parse command line arguments in fish?

Use a [`for`](http://fishshell.com/docs/current/commands.html#for) loop.

```fish
for option in $argv
    switch "$option"
        case -f --foo
        case -b --bar
        case \*
            printf "error: Unknown option %s\n" $option
    end
end
```

For a more complete CLI parsing solution, see [`getopts`](https://github.com/fisherman/getopts).

## Aliases

### How to define an alias in fish?

Create a [`function`](http://fishshell.com/docs/current/commands.html#function) and save it to ~/.config/fish/functions.

```fish
function rimraf
    rm -rf $argv
end
```

For backwards compatibility with POSIX shells, use the [`alias`](http://fishshell.com/docs/current/commands.html#alias) function.

```fish
alias rimraf "rm -rf"
```

Avoid using `alias` inside ~/.config/fish/config.fish. See the [next section](#whats-wrong-with-aliases).

### What's wrong with aliases?

Aliases created with `alias` will not be available in new shell sessions. If that's the behavior you need, then `alias` is acceptable for interactive use.

To persist aliases across shell sessions, create a [`function`](http://fishshell.com/docs/current/commands.html#function) and save it to ~/.config/fish/functions. This takes advantage of fish function [lazy-loading / autoloading](http://fishshell.com/docs/current/tutorial.html#tut_autoload) mechanism.

Using `alias` inside ~/.config/fish/config.fish will slow down your shell start as each alias/function will be eagerly loaded.

## Configuration

### Where's the .bash_profile or .bashrc equivalent in fish?

Your fish configuration is saved to ~/.config/fish/config.fish.

## IO

### How to read from a file in fish?

To read a file line by line use the [`read`](http://fishshell.com/docs/current/commands.html#read) builtin.

```fish
while read -la line
    echo $line
end < $my_file
```

### How to read from stdin in fish?

Use the [`read`](http://fishshell.com/docs/current/commands.html#read) builtin.

```fish
read --prompt "echo 'Name: ' " -l name
```

```
Name: Marvin
```

```fish
echo $name
Marvin
```

To read from an arbitrary input stream use `read` together with the [`while`](http://fishshell.com/docs/current/commands.html#while) builtin.

```fish
while read -la line
    echo $line
end
```

### How to redirect stdout or stderr to a file in fish?

Redirect stderr to `$my_file`.

```fish
my_command ^ $my_file
```

or

```fish
my_command 2> $my_file
```

Redirect stdout to `$my_file`.

```fish
my_command > $my_file
```

Redirect stdout to stderr.

```fish
my_command >&2
```

Redirect stderr to stdout.

```fish
my_command 2>&1
```

## Concurrency

### How to run a command in the background in fish?

Use `&`.

```fish
sleep 10 &
```

See also [Background jobs](http://fishshell.com/docs/current/index.html#syntax-background) in the fish documentation.

### How to check if there are background jobs running in fish?

Use the [`jobs`](http://fishshell.com/docs/current/commands.html#jobs) builtin.

```fish
if jobs > /dev/null
    echo Busy
end
```

### How to synchronize two or more background tasks in fish?

fish has no [`wait`](http://man7.org/linux/man-pages/man2/waitpid.2.html) command, but you can write your own.

First, to check if there are tasks running in the background, parse the output from the [`jobs`](http://fishshell.com/docs/current/commands.html#jobs) builtin.

<details>
<summary>Parse by Job ID</summary>

```fish
function get_jobs
    jobs $argv | command awk -v FS=\t '
        /[0-9]+\t/{
            jobs[++nJobs] = $1
        }
        END {
            for (i in jobs) {
                print(jobs[i])
            }
            exit nJobs == 0
        }
    '
end
```

</details>

<details>
<summary>Parse by Group ID</summary>

```fish
function get_jobs
    jobs -g | command awk 'NR > 0 { print; i++ } END { exit i == 0 }'
end
```

</details>

Then, block the foreground until, all background jobs are finished.

```fish
function wait
    while true
        set -l has_jobs
        set -l all_jobs (get_jobs)
        or break

        for j in $argv
            if contains -- $j $all_jobs
                set -e has_jobs
                break
            end
        end

        if set -q has_jobs
            break
        end
    end
end
```

<details>
<summary>Example</summary>

```fish
set -l urls "https://"{google,twitter,youtube,facebook,github}".com"

for url in $urls
    fish -c "curl -Lw \"$url: %{time_total}s\n\" -o /dev/null -s $url" &
end

wait (get_jobs)
```

</details>

### How to wait for a background process in fish?

fish has no [`wait`](http://man7.org/linux/man-pages/man2/waitpid.2.html) builtin. To wait for a background process to finish, use the solution described in [How to synchronize two or more background tasks in fish?](#how-to-synchronize-two-or-more-background-tasks-in-fish).

<!--
<details>
<summary>Template</summary>
</details>
-->

# The Fish Cookbook

This document is a living book of recipes to solve specific programming problems using the [fish-shell](https://github.com/fish-shell/fish-shell).

> Licensed [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0)

## What's in the menu?

- [Setup](#setup)
  - [How do I install fish?](#how-do-I-install-fish)
  - [How do I make fish my default shell?](#how-do-i-make-fish-my-default-shell)
  - [How do I find out where fish is installed?](#how-do-i-find-out-where-fish-is-installed)
- [Getting started](#getting-started)
  - [How do I learn fish?](#how-do-i-learn-fish)
  - [Where can I get help?](#where-can-i-get-help)
  - [What's a prompt and what are all these ugly characters?](#whats-a-prompt-and-what-are-all-these-ugly-characters)
  - [How do I find my current location in fish?](#how-do-i-find-my-current-location-in-fish)
  - [How do I find and run commands in fish?](#how-do-i-find-and-run-commands-in-fish)
  - [How do I check if a command succeeded in fish?](#how-do-i-check-if-a-command-succeeded-in-fish)
  - [What is the fish shebang?](#what-is-the-fish-shebang)
- [Configuration](#configuration)
  - [Where's the .bash_profile or .bashrc equivalent in fish?](#wheres-the-bash_profile-or-bashrc-equivalent-in-fish)
- [Variables](#variables)
  - [How do I set environment variables in fish?](#how-do-i-set-environment-variables-in-fish)
  - [How do I export a variable in fish?](#how-do-i-export-a-variable-in-fish)
  - [How do I list all environment variables in fish?](#how-do-i-list-all-environment-variables-in-fish)
  - [How do I set the `$PATH` persistently in fish?](#how-do-i-set-$PATH-persistently-in-fish)
  - [How do I remove a path from the `$PATH` in fish?](#how-do-i-remove-a-path-from-$PATH-variable-in-fish)
  - [How do I remove a path persistently from the `$PATH` in fish?](#how-do-i-remove-a-path-persistently-from-$PATH-variable-in-fish)
  - [How do I check if a path exists in the `$PATH` in fish?](#how-do-i-check-if-a-path-exists-in-the-$PATH-in-fish)
- [Functions](#functions)
  - [How do I create a function in fish?](#how-do-i-create-a-function-in-fish)
  - [How do I create a private function in fish?](#how-do-i-create-a-private-function-in-fish)
  - [Should function names and file names match?](#should-function-names-and-file-names-match)
  - [Can I define more than one function in a file?](#can-i-define-more-than-one-function-in-a-file)
  - [How do I show the definition of a function in fish?](#how-do-i-show-the-definition-of-a-function-in-fish)
  - [What's the difference between functions, builtins and commands in fish?](#whats-the-difference-between-functions-builtins-and-commands-in-fish)
  - [How do I list the functions defined in fish?](#how-do-i-list-the-functions-defined-in-fish)
  - [How do I check if a function exists in fish?](#how-do-i-check-if-a-function-exists-in-fish)
- [Arguments](#arguments)
  - [How do I access the arguments passed to a function in fish?](#how-do-i-access-the-arguments-passed-to-a-function-in-fish)
  - [How do I parse command line arguments in fish?](#how-do-i-parse-command-line-arguments-in-fish)
- [Aliases](#aliases)
  - [How do I define an alias in fish?](#how-do-i-define-an-alias-in-fish)
  - [What's wrong with aliases?](#whats-wrong-with-aliases)
- [IO](#io)
  - [How do I read from a file in fish?](#how-do-i-read-from-a-file-in-fish)
  - [How do I read from stdin in fish?](#how-do-i-read-from-stdin-in-fish)
  - [How do I redirect stdout or stderr to a file in fish?](#how-do-i-redirect-stdout-or-stderr-to-a-file-in-fish)
- [Concurrency](#concurrency)
  - [How do I run a command in the background in fish?](#how-do-i-run-a-command-in-the-background-in-fish)
  - [How do I check if background jobs are running in fish?](#how-do-i-check-if-background-jobs-are-running-in-fish)
  - [How do I synchronize two or more background tasks in fish?](#how-do-i-synchronize-two-or-more-background-tasks-in-fish)
  - [How do I wait for a background process in fish?](#how-do-i-wait-for-a-background-process-in-fish)

## Setup

### How do I install fish?

You can find directions in the official [website](https://fishshell.com) or follow the instructions provided here for your OS.

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
dnf install fish
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

<h2></h2>

### How do I make fish my default shell?

Once you have installed fish and it's somewhere in your `$PATH`, e.g. /usr/local/bin, you can make it your default login shell.

```fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

### How do I find out where fish is installed?

Use [`which`](https://linux.die.net/man/1/which).

```fish
which fish
/usr/local/bin/fish
```

## Getting started

### How do I learn fish?

The best way to learn fish is to dive in the official [documentation](http://fishshell.com/docs/current/index.html) and [tutorial](http://fishshell.com/docs/current/tutorial.html).

### Where can I get help?

- [r/fishshell](https://www.reddit.com/r/fishshell)
- [Gitter Channel](https://gitter.im/fish-shell/fish-shell)
- [StackOverflow `#fish`](http://stackoverflow.com/questions/tagged/fish)

### What's a prompt and what are all these ugly characters?

The prompt is where you type commands and interact with fish. Read more about the UNIX prompt [here](https://en.wikipedia.org/wiki/Command-line_interface#Command_prompt).

Maybe it looks like this:

```console
jb@mbp ~/C/fish-shell>
```

The tilde `~` is a short way to show the [home directory](http://www.linfo.org/home_directory.html), rather than `/users/jb/home`, `/Users/jb`, etc.

The `@` is an arbitrary character I like to use to separate my username `jb` and my computer's name `mbp`. You can learn to customize your prompt to show only what matters to you.

The forward slash `/` is the path delimiter. At a glance, I can see the current directory is under the home directory, inside `Code/fish-shell`. I like abbreviated paths, so only `C` is actually shown.

<details>
<summary>As of fish <code>>=2.3</code>, you can customize the length of the abbreviated path.</summary>

```fish
set fish_prompt_pwd_dir_length NUMBER
```

or

```fish
set fish_prompt_pwd_dir_length 0
```

if don't want abbreviated paths.

```console
jb@mbp ~/Code/fish-shell
```

</details>

The greater-than symbol `>` indicates the end of the prompt.

You don't like these conventions? Create your own prompt the way you want it.

> See [How do I create my own prompt in fish?](#how-do-i-create-my-own-prompt-in-fish)

### How do I find my current location in fish?

You can find out where you are via the read-only environment variable `$PWD`.

```fish
echo $PWD
/Users/jb/Code/fish-shell
```

Another way to find out the current directory is via the `pwd` builtin.

```fish
pwd
/Users/jb/Code/fish-shell
```

In fish, both `$PWD` and `pwd` always resolve symbolic links. This means that, if you are inside a directory that is a symbolic reference to another, you still get the path to the real directory.

Interactively, `pwd` is easier to type. For scripting, `$PWD` is a function call less expensive.

<details>
<summary>Show me how!</summary>

```fish
set -l cwd (pwd)
echo "The current working directory is $cwd"

# Versus

echo "The current working directory is $PWD"
```

</details>

### How do I find and run commands in fish?

To run a command type the name of the command and press return.

```fish
ls
```

Or, start typing the command you are looking for, and press tab. Fish will use the builtin pager which you can browse and select the command interactively.

Fish knows what commands are available by looking at the `$PATH` environment variable. This variable contains a list of paths, and every binary file inside any of those paths can be run by their name.

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

The `$PATH` variable is created at the start of the fish process during the environment initialization. You can modify, prepend or append to this variable yourself, e.g., in ~/.config/fish/config.fish.

Similar to the `type`, `builtin` and `functions` builtins previously introduced, \*nix systems often include one or more shell-agnostic alternatives, e.g., `which`, `apropos`, `whatis`, etc.

These commands overlap in functionality, but also possess unique features. Consult your system's manpage for details.

### How do I check if a command succeeded in fish?

Every command returns an **exit code** to indicate whether they succeeded or not. An exit code of 0 means success. Anything else means failure. Different commands use different integers to represent what errors can happen.

You can check the exit code of any command using the read-only variable `$status`.

```fish
my_command
echo $status
```

### What is the fish shebang?

The [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>) is a special comment that tells the shell to run a script with a particular program, e.g., `node`, `python`.

To run a script with `fish` by default, add a shebang to the first line in your file:

```fish
#!/usr/bin/env fish
```

<details>
<summary>Show me how!</summary>

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

### How do I set environment variables in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin.

```fish
set foo 42
```

The `set` builtin accepts the following flags to explicitly declare the scope of the variable:

- `-l`, `--local`: available only to the innermost block
- `-g`, `--global`: available outside blocks and by other functions
- `-U`, `--universal`: shared between all fish sessions and persisted across restarts of the shell
- `-x`, `--export`: available to any child process spawned in the current session

If no scope modifier is used, the variable will be local to the current function; otherwise, it will be global.

If the variable has already been defined, the previous scope will be used.

<details>
<summary>Local Variables</summary>

The variable `foo` will not be available outside of the `if` block.

```fish
if true
    set -l foo 42
end

echo "foo=$foo" # foo=
```

</details>

<details>
<summary>Global Variables</summary>

The variable `foo` will be available outside the `if` block.

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
set -Ux GPG_AGENT_INFO /Users/jb/.gnupg/S.gpg-agent:12345:2
```

</details>

### How do I export a variable in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin and the scope modifier `-x` or `--export`.

```fish
set -x foo 42
fish -c 'echo "foo=$foo"' # foo=42
```

### How do I list all environment variables in fish?

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

### How do I set the `$PATH` persistently in fish?

The correct way to persistently add a path to your `$PATH` is using fish `$fish_user_paths` variable.

```fish
set -U fish_user_paths $fish_user_paths my_path
```

> See [`$PATH`](http://fishshell.com/docs/current/tutorial.html#tut_path) in the fish tutorial for more information.

### How do I remove a path from the `$PATH` in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin with the `-e` or `--erase` flag in combination with the [`contains`](http://fishshell.com/docs/current/commands.html#contains) builtin to find the index of the path you want to remove.

```fish
if set -l index (contains -i $my_path $PATH)
    set -e PATH[$index]
end
```

### How do I remove a path persistently from the `$PATH` in fish?

Use the [`set`](http://fishshell.com/docs/current/commands.html#set) builtin with the `-e` or `--erase` flag in combination with the [`contains`](http://fishshell.com/docs/current/commands.html#contains) builtin to find the index of the path you want to remove.

```fish
if set -l index (contains -i $my_path $fish_user_paths)
    set -e -U fish_user_paths[$index]
end
```

### How do I check if a path exists in the `$PATH` in fish?

Use the [`contains`](http://fishshell.com/docs/current/commands.html#contains) builtin.

```fish
if contains $my_path $PATH
    # $my_path is in $PATH
end
```

## Functions

### How do I create a function in fish?

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

Alternatively, you can use the [`functions`](http://fishshell.com/docs/current/commands.html#functions) builtin to write the function definition to a file.

```fish
functions mkdirp > ~/.config/fish/functions/mkdirp.fish
```

### How do I create a private function in fish?

You can't. In fish, functions are always public.

As a workaround, use a custom namespace to prefix any function you want to treat as private.

```fish
function _prefix_my_function
end
```

It's not impossible to simulate private scope using [`functions -e`](http://fishshell.com/docs/current/commands.html#functions).

<details>
<summary>Show me how!</summary>

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
<summary>Show me how!</summary>

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

Try to run `bar`, then `foo`, then `bar` again.

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

Yes, you can. Note that [fish does not have private functions](http://stackoverflow.com/a/27657662/2903889), so every function in the file ends up in the global scope when the file is loaded. Functions are eagerly loaded as well, which it's not as effective as using one function per file.

### How do I show the definition of a function in fish?

If you know the command is a function, use the [`functions`](http://fishshell.com/docs/current/commands.html#functions) builtin.

```fish
functions my_function
```

If you are not sure whether the command is a function, a builtin or a system command, use [`type`](http://fishshell.com/docs/current/commands.html#type).

```fish
type fish
fish is /usr/local/bin/fish
```

### What's the difference between functions, builtins, and commands in fish?

System commands are executable scripts, binaries or symbolic links to binaries present in your [`$PATH`](https://fishshell.com/docs/current/tutorial.html#tut_path) variable. A command runs as a child process and has only access to environment variables which have been exported. Example: `fish`.

Functions are user-defined. Some functions are included with your fish distribution. Example: [`eval`](http://fishshell.com/docs/current/commands.html#eval).

Builtins are commands compiled with the fish executable. Builtins have access to the environment, so they behave like functions. Builtins do not spawn a child process. Example: [`functions`](http://fishshell.com/docs/current/commands.html#functions).

### How do I list the functions defined in fish?

Use the [`functions`](http://fishshell.com/docs/current/commands.html#functions) builtin without arguments.

The list will omit functions whose name start with an underscore. Functions that start with an underscore are often called _hidden_. To show everything, use `functions -a` or `functions --all`.

Alternatively, launch the fish Web-based configuration and navigate to the /functions tab.

```
fish_config functions
```

### How do I check if a function exists in fish?

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

### How do I access the arguments passed to a function in fish?

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

### How do I access the arguments passed to a script in fish?

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

### How do I parse command line arguments in fish?

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

For a more complete CLI parsing solution, see [`getopts`](https://github.com/jorgebucaran/fish-getopts).

## Aliases

### How do I define an alias in fish?

Create a [`function`](http://fishshell.com/docs/current/commands.html#function) and save it to ~/.config/fish/functions.

```fish
function rimraf
    rm -rf $argv
end
```

For backward compatibility with POSIX shells, use the [`alias`](http://fishshell.com/docs/current/commands.html#alias) function.

```fish
alias rimraf "rm -rf"
```

Avoid using `alias` inside ~/.config/fish/config.fish.

### What's wrong with aliases?

Aliases created with `alias` will not be available in new shell sessions. If that's the behavior you need, then `alias` is acceptable for interactive use.

To persist aliases across shell sessions, create a [`function`](http://fishshell.com/docs/current/commands.html#function) and save it to ~/.config/fish/functions. This takes advantage of fish function [lazy-loading / autoloading](http://fishshell.com/docs/current/tutorial.html#tut_autoload) mechanism.

Using `alias` inside ~/.config/fish/config.fish will slow down your shell start as each alias/function will be eagerly loaded.

## Configuration

### Where's the .bash_profile or .bashrc equivalent in fish?

Your fish configuration is saved to ~/.config/fish/config.fish.

## IO

### How do I read from a file in fish?

To read a file line by line, use the [`read`](http://fishshell.com/docs/current/commands.html#read) builtin.

```fish
while read -la line
    echo $line
end < my_file
```

### How do I read from stdin in fish?

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

### How do I redirect stdout or stderr to a file in fish?

Redirect stderr to `$my_file`.

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

### How do I run a command in the background in fish?

Use `&`.

```fish
sleep 10 &
```

> See also [Background jobs](http://fishshell.com/docs/current/index.html#syntax-background) in the fish documentation.

### How do I check if background jobs are running in fish?

Use the [`jobs`](http://fishshell.com/docs/current/commands.html#jobs) builtin.

```fish
if jobs > /dev/null
    echo Busy
end
```

### How do I synchronize two or more background tasks in fish?

Since fish `3.0.0` there is a dedicated [`wait`](https://fishshell.com/docs/current/commands.html#wait), but you can write your own if you are using an older fish.

First, to check if tasks are running in the background, parse the output from the [`jobs`](http://fishshell.com/docs/current/commands.html#jobs) builtin.

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

Then, block the foreground until all background jobs are finished.

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
<summary>Show me how!</summary>

```fish
set -l urls "https://"{google,twitter,youtube,facebook,github}".com"

for url in $urls
    fish -c "curl -Lw \"$url: %{time_total}s\n\" -o /dev/null -s $url" &
end

wait (get_jobs)
```

</details>

### How do I wait for a background process in fish?

Since fish `3.0.0` there is a dedicated [`wait`](https://fishshell.com/docs/current/commands.html#wait) builtin to wait for a background process. For older fish distributions without `wait`, use the technique described in [How do I synchronize two or more background tasks in fish?](#how-do-i-synchronize-two-or-more-background-tasks-in-fish).

<!--
<details>
<summary>Template</summary>
</details>
-->

<h2></h2>

[![CC0](https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-nc-sa.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0)

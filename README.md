# The Fish Cookbook

> From Shell to Plate: Savor the Zest of Fish 🦞

Welcome to The Fish Cookbook, your ultimate guide to unlocking the full potential of shell scripting with the delightful [Fish](https://fishshell.com). With its user-friendliness and convenient features, Fish stands out as a true gem among shells.

Master programming challenges with our curated collection of Fish recipes. Glide through your code with ease, whether you're a seasoned pro or a shell scripting newbie.

This cookbook is licensed under [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0), ensuring knowledge and inspiration flow while respecting the rights of others.

## What's on the Menu?

- [Setting Sail](#setting-sail)
  - [How the Shell do I Install Fish?](#how-the-shell-do-i-install-fish)
  - [Making Fish Your Default Shell, Ahoy!](#making-fish-your-default-shell-ahoy)
  - [Discovering Fish's Installation Location](#discovering-fishs-installation-location)
  - [Where to Seek Help](#where-to-seek-help)
- [Foundations](#foundations)
  - [Decoding Prompts: What Are These Wiggly Characters?](#decoding-prompts-what-are-these-wiggly-characters)
  - [Where Am I in Fish? Discovering Your Current Path](#where-am-i-in-fish-discovering-your-current-path)
  - [Searching and Running Commands in Fish: How Do I Do That?](#searching-and-running-commands-in-fish-how-do-i-do-that)
  - [Did My Command Succeed in Fish?](#did-my-command-succeed-in-fish)
  - [What's the Fish Shebang All About? Making Scripts Executable](#whats-the-fish-shebang-all-about-making-scripts-executable)
  - [How Do I Debug My Fish Scripts Interactively? Navigating with Breakpoints](#how-do-i-debug-my-fish-scripts-interactively-navigating-with-breakpoints)
  - [Where to find Fish's equivalent of `.bash_profile` or `.bashrc`?](#where-to-find-fishs-equivalent-of-bash_profile-or-bashrc)
- [All About Variables](#all-about-variables)
  - [How Do I Set Variables in Fish? A Quick Guide to Variable Scopes](#how-do-i-set-variables-in-fish-a-quick-guide-to-variable-scopes)
  - [How Do I Export a Variable in Fish?](#how-do-i-export-a-variable-in-fish)
  - [How Do I List All Environment Variables in Fish?](#how-do-i-list-all-environment-variables-in-fish)
  - [How Do I Set the `$PATH` Persistently in Fish?](#how-do-i-set-the-path-persistently-in-fish)
  - [How Do I Remove a Path from the `$PATH` in Fish?](#how-do-i-remove-a-path-from-the-path-in-fish)
  - [How Do I Remove a Path Persistently from the `$PATH` in Fish?](#how-do-i-remove-a-path-persistently-from-the-path-in-fish)
  - [How Do I Check if a Path Exists in the `$PATH` in Fish?](#how-do-i-check-if-a-path-exists-in-the-path-in-fish)
- [All About Functions](#all-about-functions)
  - [How Do I Whip Up a Function in Fish?](#how-do-i-whip-up-a-function-in-fish)
  - [How Do I Craft a "Private" Function in Fish?](#how-do-i-craft-a-private-function-in-fish)
  - [Should Function Names and File Names Be a Perfect Match?](#should-function-names-and-file-names-be-a-perfect-match)
  - [Can I Fit Multiple Functions in a Single File?](#can-i-fit-multiple-functions-in-a-single-file)
  - [How Do I Reveal a Function's Definition in Fish?](#how-do-i-reveal-a-functions-definition-in-fish)
  - [Exploring Functions, Builtins, and Commands in Fish](#exploring-functions-builtins-and-commands-in-fish)
  - [Displaying the Fish Function Roster](#displaying-the-fish-function-roster)
  - [Verifying a Function's Existence in Fish](#verifying-a-functions-existence-in-fish)
- [All About Arguments](#all-about-arguments)
  - [Accessing Function Arguments in Fish](#accessing-function-arguments-in-fish)
  - [Accessing Script Arguments in Fish](#accessing-script-arguments-in-fish)
  - [Parsing Command Line Arguments in Fish](#parsing-command-line-arguments-in-fish)
- [All About Aliases](#all-about-aliases)
  - [The Art of Defining Aliases in Fish](#the-art-of-defining-aliases-in-fish)
  - [The Problem with Aliases in `config.fish`](#the-problem-with-aliases-in-configfish)
- [IO](#io)
  - [Reading a File with Fish](#reading-a-file-with-fish)
  - [Reading from stdin and Redirecting Like a Pro in Fish](#reading-from-stdin-and-redirecting-like-a-pro-in-fish)
  - [Mastering Redirection in Fish](#mastering-redirection-in-fish)
- [Concurrency: Making Your Fish Swim Faster](#concurrency-making-your-fish-swim-faster)
  - [Run Commands in the Background with Fish](#run-commands-in-the-background-with-fish)
  - [Checking Background Jobs in Fish](#checking-background-jobs-in-fish)
  - [Synchronize Background Tasks in Fish Like a Pro](#synchronize-background-tasks-in-fish-like-a-pro)
- [Glossary](#glossary)
- [Contributing](#contributing)

## Setting Sail

Ahoy there, matey! Prepare to embark on a grand adventure with our trusty mate, Fish. In this section, we'll guide you through the step-by-step setup process to ensure you're ready to navigate the command line seas like a true captain. Let's get your shipshape and ready for the voyage ahead!

### How the Shell do I Install Fish?

If you're ready to dive into the wonderful world of Fish, here's how you can get your hands wet. You can either follow the official [website](https://fishshell.com) for instructions, or stick around and sail through the directions provided here for your OS.

**For macOS with Homebrew:**

```bash
brew update && brew install fish
```

**For Debian:**

```bash
wget http://download.opensuse.org/repositories/shells:fish:release:2/Debian_8.0/Release.key
apt-key add - < Release.key
echo 'deb http://download.opensuse.org/repositories/shells:/fish:/release:/2/Debian_8.0/ /' >> /etc/apt/sources.list.d/fish.list
apt-get update
apt-get install fish
```

**For Ubuntu:**

```bash
sudo apt-add-repository ppa:fish-shell/release-2
sudo apt-get update
sudo apt-get install fish
```

**For CentOS:**

```bash
cd /etc/yum.repos.d/
wget http://download.opensuse.org/repositories/shells:fish:release:2/CentOS_7/shells:fish:release:2.repo
yum install fish
```

**For Fedora:**

```bash
dnf install fish
```

**For Arch Linux:**

```bash
pacman -S fish
```

**For Gentoo:**

```bash
emerge fish
```

**For FreeBSD:**

```bash
pkg install fish
```

**For NetBSD:**

```bash
pkgin install fish
```

**For OpenBSD:**

```bash
pkg_add fish
```

**For the brave who want to build from source:**

```bash
sudo apt-get -y install git gettext automake autoconf ncurses-dev build-essential libncurses5-dev

git clone -q --depth 1 https://github.com/fish-shell/fish-shell
cd fish-shell
autoreconf && ./configure
make && sudo make install
```

With Fish installed, a thrilling journey lies ahead. Gear up to explore the command line, unearthing Fish's core treasures and secrets. Here's to abundant and joyous fishing ventures! 🍻

### Making Fish Your Default Shell, Ahoy!

Once you've installed Fish and it's safely located in your `$PATH`, for example, at /usr/local/bin, you can make it your default shell for a smooth sailing command line experience.

```fish
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish
```

### Discovering Fish's Installation Location

Curious about where Fish is installed? Utilize the handy [`which`](https://linux.die.net/man/1/which) command.

```fish
which fish
/usr/local/bin/fish
```

### Where to Seek Help

If you find yourself in need of assistance or have burning questions about Fish, fret not. There's a treasure trove of resources awaiting you:

- [Official Repository](https://github.com/fish-shell/fish-shell) – Explore the official Fish repository on GitHub, where you can find the source code and contribute to the project.
- [Tutorial](https://fishshell.com/docs/current/tutorial.html) – Set sail with the Fish tutorial, a step-by-step guide to help you master the shell's features and functionality.
- [Documentation](https://fishshell.com/docs/current/index.html) – Dive into the official documentation for Fish, where you'll discover a wealth of information and guidance.
- [`r/fishshell`](https://www.reddit.com/r/fishshell) – Join the community on Reddit, where fellow Fish enthusiasts gather to share their knowledge and adventures.
- [Gitter Channel](https://gitter.im/fish-shell/fish-shell) – Hop aboard the Gitter Channel, a chat platform where you can engage with other Fish users and seek live assistance.
- [StackOverflow `#fish`](http://stackoverflow.com/questions/tagged/fish) – Cast your questions into the StackOverflow sea, specifically in the `#fish` tag, to receive guidance from the wider programming community.
- [awsm.fish](https://git.io/awsm.fish) – Discover a curated collection of prompts, plugins, and other hidden treasures to enhance your Fish journey. 🐚

## Foundations

### Decoding Prompts: What Are These Wiggly Characters?

The prompt is where you type commands and interact with Fish. Read more about the UNIX prompt [here](https://en.wikipedia.org/wiki/Command-line_interface#Command_prompt).

You might encounter something like this:

```console
jb@mbp ~/C/cookbook>
```

The tilde `~` represents the [home directory](http://www.linfo.org/home_directory.html) in a compact form, instead of `/users/jb/home`, `/Users/jb`, and so on.

The `@` symbol is an arbitrary character chosen to separate the username `jb` from the computer's name `mbp`. You can learn to tailor your prompt to display only what's relevant to you.

The forward slash `/` serves as the path delimiter. At a glance, you can see that the current directory is inside the home directory, under `Code/cookbook`. The abbreviated path displays just `C`.

To customize the length of the abbreviated path, use:

```fish
set fish_prompt_pwd_dir_length NUMBER
```

Or, if you prefer not to have abbreviated paths:

```fish
set fish_prompt_pwd_dir_length 0
```

Then, your prompt will look like this:

```console
jb@mbp ~/Code/cookbook>
```

The greater-than symbol `>` signifies the end of the prompt.

Not a fan of these conventions? Feel free to craft your own prompt to suit your preferences.

### Where Am I in Fish? Discovering Your Current Path

To find your current location in Fish, simply refer to the read-only environment variable `$PWD`.

```fish
echo $PWD
/Users/jb/Code/cookbook
```

Alternatively, you can use the `pwd` builtin to determine the current directory.

```fish
pwd
/Users/jb/Code/cookbook
```

In Fish, both `$PWD` and `pwd` always resolve symbolic links. This means that if you're inside a directory that's a symbolic reference to another, you'll still get the path to the actual directory.

Interactively, typing `pwd` is more convenient. For scripting, `$PWD` is less expensive in terms of function calls.

<details>
<summary>Dazzle me!</summary>

```fish
echo "The current working directory is "(pwd)

# Versus

echo "The current working directory is $PWD"
```

</details>

### Searching and Running Commands in Fish: How Do I Do That?

To run a command, type the command's name and press return.

```fish
ls
```

Alternatively, begin typing the command you're looking for and press tab. Fish will use the built-in pager, allowing you to browse and select the command interactively.

Fish determines which commands are available by examining the `$PATH` environment variable. This variable contains a list of paths, and every binary file inside any of those paths can be run by their name.

Display your `$PATH` contents with:

```fish
printf "%s\n" $PATH
/usr/local/bin
/usr/bin
/bin
```

To list every command in your system and display them in columns, use:

```fish
ls $PATH | column
```

If the list is truncated, try:

```fish
ls $PATH | column | less
```

Navigate the list using `k` and `j` to move down/up, and press `q` to exit.

The `$PATH` variable is created at the beginning of the Fish process during environment initialization. You can modify, prepend, or append this variable yourself, for example, in `~/.config/fish/config.fish`.

In addition to the `type`, `builtin`, and `functions` built-ins mentioned earlier, \*nix systems often include one or more shell-agnostic alternatives such as `which`, `apropos`, `whatis`, and others.

These commands have overlapping functionality but also possess unique features. Consult your system's manpage for more information.

### Did My Command Succeed in Fish?

Every command returns an **exit code** to indicate whether it succeeded or not. An exit code of 0 means success, while any other value signifies failure. Different commands use various integers to represent possible errors.

In Fish, you can check the exit code of any command using the read-only variable `$status`.

```fish
my_command
echo $status
```

When working with pipes, Fish provides a helpful variable called `$pipestatus` that allows you to check the exit codes of all commands in a pipeline.

Suppose you have a pipeline like this:

```fish
command1 | command2 | command3
```

To find the exit codes of all commands in the pipeline, use `$pipestatus`:

```fish
echo $pipestatus
```

This will print an array of exit codes, one for each command in the pipeline. For example, if `command1` succeeded, `command2` failed with an exit code of 2, and `command3` failed with an exit code of 1, the output would look like this:

```
0 2 1
```

With `$pipestatus`, you can conveniently keep an eye on the success and failure of commands in your pipelines.

### What's the Fish Shebang All About? Making Scripts Executable

The [shebang](<https://en.wikipedia.org/wiki/Shebang_(Unix)>) is a special comment that instructs the shell to run a script using a specific program, such as `node` or `python`.

To run a script with `fish` by default, add a shebang to the first line of your file:

```fish
#!/usr/bin/env fish
```

<details>
<summary>Give me the scoop!</summary>

```fish
#!/usr/bin/env fish

echo "Check this out, ma'! I'm a Fish on wheels 🛼"
```

Save that to a file and mark it as executable.

```fish
chmod +x my_script
```

The system above allows you to run the script directly by using its path:

```fish
./my_script
```

instead of:

```fish
fish my_script
```

</details>

### How Do I Debug My Fish Scripts Interactively? Navigating with Breakpoints

To interactively debug your Fish scripts, use the [`breakpoint`](https://fishshell.com/docs/current/cmds/breakpoint.html) builtin. Simply drop it anywhere in your script where you want to pause execution and launch an interactive debugging prompt.

```fish
function some_function
    set --local files (ls ~)
    breakpoint # when this is executed, an interactive prompt will be launched and you will be able to inspect $files
    # ... rest of function is not executed until you exit from debugger
end
```

With `breakpoint`, you can take a closer look at your script's execution, inspect variables, and navigate through the script.

### Where to find Fish's equivalent of `.bash_profile` or `.bashrc`?

In Fish shell, your configuration is stored in the `config.fish` file located at `~/.config/fish/config.fish`. This file serves as Fish's equivalent to `.bash_profile` or `.bashrc` in Bash. It allows you to customize and configure your Fish shell environment by adding functions, environment variables, and other personalized settings.

## All About Variables

### How Do I Set Variables in Fish? A Quick Guide to Variable Scopes

To set variables in Fish, use the [`set`](https://fishshell.com/docs/current/cmds/set.html) builtin.

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

#### Local Variables

The variable `foo` will not be available outside of the `if` block.

```fish
if true
    set -l foo 42
end

echo "foo=$foo" # foo=
```

#### Global Variables

The variable `foo` will be available outside the `if` block.

```fish
if true
    set -g foo 42
end

echo "foo=$foo" # foo=42
```

#### Universal Variables

The variable `foo` will be preserved and available to future shell sessions.

```fish
set -U foo 42
fish
echo "foo=$foo" # foo=42
```

#### Exported Variables

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

Now you're set to sail through the variable seas of Fish!

### How Do I Export a Variable in Fish?

To export a variable in Fish, use the [`set`](https://fishshell.com/docs/current/cmds/set.html) builtin along with the scope modifier `-x` or `--export`.

```fish
set -x foo 42
fish -c 'echo "foo=$foo"' # foo=42
```

By using the `-x` or `--export` option, you're ensuring that the variable is available to any child process spawned in the current session.

### How Do I List All Environment Variables in Fish?

To list all environment variables in Fish, use the [`set`](https://fishshell.com/docs/current/cmds/set.html) builtin without any modifier flags.

```fish
set
```

If you prefer to see only the variable names without the values, employ the `--names` option:

```fish
set --names
```

And for a full view of each variable without truncating long lines, go with `--long`:

```fish
set --long
```

### How Do I Set the `$PATH` Persistently in Fish?

To persistently add a path to your `$PATH` in Fish, make use of the `$fish_user_paths` variable.

```fish
set -U fish_user_paths $fish_user_paths my_path
```

If you're using Fish 3.2.1 or later, you can opt for the built-in `fish_add_path` function instead.

```fish
fish_add_path my_path
```

> See [`$PATH`](https://fishshell.com/docs/current/tutorial.html#path) in the Fish tutorial for juicy information.

### How Do I Remove a Path from the `$PATH` in Fish?

To remove a path from the `$PATH` in Fish, use the [`set`](https://fishshell.com/docs/current/cmds/set.html) builtin with the `-e` or `--erase` flag, combined with the [`contains`](https://fishshell.com/docs/current/cmds/contains.html) builtin to find the index of the path you'd like to remove.

```fish
if set -l index (contains -i $my_path $PATH)
    set -e PATH[$index]
end
```

### How Do I Remove a Path Persistently from the `$PATH` in Fish?

To remove a path persistently from the `$PATH` in Fish, use the [`set`](https://fishshell.com/docs/current/cmds/set.html) builtin with the `-e` or `--erase` flag, combined with the [`contains`](https://fishshell.com/docs/current/cmds/contains.html) builtin to find the index of the path you'd like to remove from the `$fish_user_paths` variable.

```fish
if set -l index (contains -i $my_path $fish_user_paths)
    set -e -U fish_user_paths[$index]
end
```

### How Do I Check if a Path Exists in the `$PATH` in Fish?

To check if a path exists in the `$PATH` in Fish, use the [`contains`](https://fishshell.com/docs/current/cmds/contains.html) builtin. This handy tool helps you verify whether your desired path is swimming along with the other paths in your `$PATH` variable. 🐠

```fish
if contains $my_path $PATH
    # $my_path is in $PATH
end
```

## All About Functions

### How Do I Whip Up a Function in Fish?

Crafting a function in Fish is a piece of cake! Just use the [`function`](https://fishshell.com/docs/current/cmds/function.html) builtin to start creating your shell masterpiece.

```fish
function mkdirp
    mkdir -p $argv
end
```

To make sure this function stays fresh in future Fish sessions, save it to ~/.config/fish/functions/mkdirp.fish. A neat way to accomplish this is by using the [`funcsave`](https://fishshell.com/docs/current/cmds/funcsave.html) function.

```fish
funcsave mkdirp
```

Alternatively, you can use the [`functions`](https://fishshell.com/docs/current/cmds/functions.html) builtin to write the function definition to a file, like a secret recipe for your custom shell commands.

```fish
functions mkdirp > ~/.config/fish/functions/mkdirp.fish
```

### How Do I Craft a "Private" Function in Fish?

While Fish doesn't have built-in private functions, you can still be sneaky! Use a custom namespace to prefix any function you want to treat as private.

```fish
function _prefix_my_function
end
```

You can also simulate private scope using [`functions -e`](https://fishshell.com/docs/current/cmds/functions.html).

<details>
<summary>Show me the secret sauce!</summary>

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

This workaround helps you keep some Fish functions under wraps, like a top-secret ingredient in your shell recipe.

### Should Function Names and File Names Be a Perfect Match?

Absolutely! Fish's [lazy-loading / autoloading](https://fishshell.com/docs/current/tutorial.html#autoloading-functions) mechanism depends on this match made in heaven.

If you have a file ~/.config/fish/functions/foo.fish with a valid function definition `bar`:

1. In a new shell, trying to run `bar` produces an unknown-command error.
2. Typing `foo` will highlight as a valid command, but produce an unknown-command error.
3. Trying to run `bar` again now works like a charm.

<details>
<summary>Show me the magic!</summary>

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

### Can I Fit Multiple Functions in a Single File?

Yes, indeed! You can define as many functions as you want in a single file. Just remember that Fish [doesn't have private functions](http://stackoverflow.com/a/27657662/2903889), so every function in the file will end up in the global scope when the file is loaded.

Since functions are eagerly loaded, defining multiple functions in a single file might not be as efficient as the one-function-per-file approach, which leverages Fish's autoloading capabilities. So, while it's possible to have multiple functions in one file, spreading them across separate files might give you a performance boost and a more organized structure.

### How Do I Reveal a Function's Definition in Fish?

If you're certain that the command you're looking for is a function, you can use the [`functions`](https://fishshell.com/docs/current/cmds/functions.html) builtin to display its definition:

```fish
functions my_function
```

On the other hand, if you're not sure whether the command is a function, a builtin, or a system command, you can rely on the [`type`](https://fishshell.com/docs/current/cmds/type.html) command to reveal its true nature:

```fish
type my_function
my_function is a function with definition
# ... function definition ...
```

Using `type`, you can easily identify what kind of command you're dealing with and get the information you need.

### Exploring Functions, Builtins, and Commands in Fish

In Fish, commands, functions, and builtins each serve different purposes and are defined in different ways:

- **System commands** are executable scripts, binaries, or symbolic links to binaries that are located in directories listed in your [`$PATH`](https://fishshell.com/docs/current/tutorial.html#path) variable. When a command runs, it operates as a child process and can only access environment variables that have been exported. Example: `fish`.

- **Functions** are user-defined commands that can be created within Fish. Some functions are included as part of the Fish distribution and serve as predefined helpers. Examples include [`alias`](https://fishshell.com/docs/current/cmds/alias.html), [`type`](https://fishshell.com/docs/current/cmds/type.html), and [`nextd`](https://fishshell.com/docs/current/cmds/nextd.html).

- **Builtins** are commands that have been compiled directly into the Fish executable. Like functions, builtins can access the environment, but they do not spawn a separate child process. This allows them to execute more quickly and with lower overhead. Examples of builtins include [`functions`](https://fishshell.com/docs/current/cmds/functions.html) and [`set`](https://fishshell.com/docs/current/cmds/set.html).

These different types of commands help make Fish a versatile and powerful shell, allowing for a wide range of customization and utility.

### Displaying the Fish Function Roster

To list all the functions defined in Fish, employ the [`functions`](https://fishshell.com/docs/current/cmds/functions.html) builtin without any arguments. Note that hidden functions—those with names starting with an underscore—won't be displayed. To reveal everything, including hidden functions, use `functions -a` or `functions --all`.

For a different approach, launch the Fish web-based configuration and head to the /functions tab by running:

```
fish_config functions
```

### Verifying a Function's Existence in Fish

The [`type`](https://fishshell.com/docs/current/cmds/type.html) function is your go-to tool for checking whether a function exists in Fish. It provides information about commands, builtins, or functions.

```fish
if not type --quiet "$command_name"
    exit 1
end
```

<details>
<summary>For builtins, use <code><a href="https://fishshell.com/docs/current/cmds/builtin.html">builtin --names</a></code>.</summary>

```fish
if not contains -- "$command_name" (builtin --names)
    exit 1
end
```

</details>

<details>
<summary>For functions, employ <code><a href="https://fishshell.com/docs/current/cmds/functions.html">functions --query</a></code>.</summary>

```fish
if not functions --query "$command_name"
    exit 1
end
```

</details>

<details>
<summary>For other commands, utilize <code><a href="https://fishshell.com/docs/current/cmds/command.html">command --search</a></code>.</summary>

```fish
if not command --search "$command_name" > /dev/null
    exit 1
end
```

In Fish >= 2.5, it's even easier:

```fish
if not command --search --quiet "$command_name"
    exit 1
end
```

</details>

## All About Arguments

### Accessing Function Arguments in Fish

To access the arguments passed to a function in Fish, simply use the `$argv` variable.

```fish
function Foo
    printf "%s\n" $argv
end

Foo foo bar baz
foo
bar
baz
```

### Accessing Script Arguments in Fish

To access the arguments passed to a script in Fish, use `$argv`.

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

### Parsing Command Line Arguments in Fish

To parse command line arguments in Fish, you can use a [`for`](https://fishshell.com/docs/current/cmds/for.html) loop.

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

For a more powerful parsing solution, you can explore Fish's official [`argparse`](https://fishshell.com/docs/current/cmds/argparse.html) builtin. Another option is to consider using [`getopts`](https://github.com/jorgebucaran/getopts.fish), which is a different approach to CLI parsing.

## All About Aliases

### The Art of Defining Aliases in Fish

Fish offers the [`alias`](https://fishshell.com/docs/current/cmds/alias.html) function to create a convenient alias:

```fish
alias rimraf "rm -rf"
```

This creates a [`function`](https://fishshell.com/docs/current/cmds/function.html) like:

```fish
function rimraf --wraps='rm -rf' --description 'alias rimraf rm -rf'
  rm -rf $argv;
end
```

Be aware that aliases created with `alias` won't be available in new shell sessions. To make them persistent, use:

```
alias -s ...
```

This saves the alias to `~/.config/fish/functions/[alias-name].fish`

### The Problem with Aliases in `config.fish`

Defining aliases inside `~/.config/fish/config.fish` slows down your shell start since each alias/function is eagerly loaded.

To persist aliases across shell sessions, use `alias -s`, which creates a [`function`](https://fishshell.com/docs/current/cmds/function.html) and saves it to `~/.config/fish/functions`. This leverages Fish function [lazy-loading / autoloading](https://fishshell.com/docs/current/tutorial.html#autoloading-functions) mechanism.

## IO

### Reading a File with Fish

To gracefully read a file line by line in Fish, employ the [`read`](https://fishshell.com/docs/current/cmds/read.html) builtin.

```fish
while read -la line
    echo $line
end < my_file
```

### Reading from stdin and Redirecting Like a Pro in Fish

To read from stdin in Fish, the [`read`](https://fishshell.com/docs/current/cmds/read.html) builtin is your best friend.

```fish
read --prompt "echo 'Name: ' " -l name
```

```
Name: Flipper
```

```fish
echo $name
Flipper
```

To read from an arbitrary input stream, combine `read` with the [`while`](https://fishshell.com/docs/current/cmds/while.html) builtin.

```fish
while read -la line
    echo $line
end
```

### Mastering Redirection in Fish

To redirect stderr to `$my_file`:

```fish
my_command 2> $my_file
```

To redirect stdout to `$my_file`:

```fish
my_command > $my_file
```

To redirect stdout to stderr:

```fish
my_command >&2
```

To redirect stderr to stdout:

```fish
my_command 2>&1
```

## Concurrency: Making Your Fish Swim Faster

### Run Commands in the Background with Fish

To run a command in the background in Fish, simply use `&`.

```fish
sleep 10 &
```

### Checking Background Jobs in Fish

To see if background jobs are running in Fish, use the [`jobs`](https://fishshell.com/docs/current/cmds/jobs.html) builtin.

```fish
if jobs > /dev/null
    echo Busy
end
```

### Synchronize Background Tasks in Fish Like a Pro

Fish `3.0.0` introduced a dedicated [`wait`](https://fishshell.com/docs/current/cmds/wait.html) builtin for easy synchronization of background tasks. But if you're curious about how it was done before `wait` existed, here's a throwback recipe for you.

First, to check if tasks are running in the background, parse the output from the [`jobs`](https://fishshell.com/docs/current/cmds/jobs.html) builtin.

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

Next, block the foreground until all background jobs are finished.

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

Here's an example of our code in action.

```fish
set -l urls "https://"{google,twitter,youtube,facebook,github}".com"

for url in $urls
    fish -c "curl -Lw \"$url: %{time_total}s\n\" -o /dev/null -s $url" &
end

wait (get_jobs)
```

## Glossary

Here is a concise glossary of key terms and concepts mentioned in the Fish Shell Cookbook:

- **Fish**: Fish, short for "Friendly Interactive Shell," is a command-line shell for Unix-like operating systems. It is known for its user-friendly features, syntax highlighting, auto-suggestions, and powerful scripting capabilities.

- **Fish Installation**: Installing Fish involves obtaining the Fish shell and setting it up on your system. You can install Fish using package managers or by building it from source.

- **Default Shell**: The default shell is the shell that is automatically launched when you open a terminal or log in to your system. Setting Fish as the default shell ensures that Fish is the shell you interact with by default.

- **Fish Configuration**: The Fish configuration involves customizing the behavior and appearance of the Fish shell. Configuration options can be set in the `config.fish` file, which is loaded when Fish starts.

- **Variables**: Variables in Fish are used to store and manipulate data. They can hold strings, numbers, or other types of values. Variables can be defined, assigned values, and accessed in Fish scripts and interactive sessions.

- **Functions**: Functions in Fish allow you to group a series of commands together and give them a name. Functions can be defined with the `function` keyword and called by their name.

- **IO (Input/Output)**: IO refers to the input and output operations performed by the shell. Fish provides various commands and techniques for reading from files, redirecting output, and handling input streams.

- **Concurrency**: Concurrency in Fish involves running commands or tasks simultaneously. Fish allows you to run commands in the background, check the status of background jobs, synchronize tasks, and wait for background processes to complete.

These terms provide a high-level understanding of the key concepts covered in the Fish Cookbook. Refer to the respective sections in this document for more detailed information and practical examples.

## Contributing

Ahoy there! We're excited to have you on board for the Fish Cookbook adventure! Your contributions can make this Cookbook a valuable resource for the Fish Shell community. So, let's dive in and follow the guidelines below.

You can contribute to the Cookbook in a few ways:

- **Adding new recipes**: If you have a useful Fish Shell recipe or a clever solution to a pesky problem, you can share your knowledge by adding a new recipe to the repository. Just make sure your recipe follows the established structure and provides clear instructions. Let's make this Cookbook even more diverse and flavorful!

- **Enhancing existing recipes**: If you come across a recipe that could use some sprucing up, you can lend a hand and make it even better. Improve the content, add more information, fix any errors, or fine-tune the code. Together, we'll make those recipes shine!

- **Keeping the Cookbook current**: The Fish shell is continuously evolving, with new features and updates being released regularly. Help us ensure the Cookbook stays relevant by identifying outdated content, highlighting new features or changes, and proposing updates to the existing recipes. By keeping the Cookbook in sync with the latest Fish shell developments, we'll maintain a valuable and current resource for everyone to enjoy.

To join our crew and contribute to the Cookbook, follow these guidelines:

1. Set your sails and fork the repository. Then, create a new branch for your contributions—a safe space for your changes.
2. Work your magic in the new branch. Ensure that the content is accurate, clear, and follows the agreed-upon structure. We're all on the same ship here!
3. If you're adding a new recipe, choose a catchy and informative title—one that grabs attention!
4. Commit your changes and write a descriptive commit message to let us know what your changes are all about. Be as detailed as a well-crafted map!
5. Push your branch to your forked repository, like a captain charting new waters.
6. Open a pull request against the main repository. Share the story behind your changes and why they're valuable. The more we know, the better we can appreciate your work!

Once your pull request is submitted, our trusty crew of maintainers will review it. They may provide feedback or request some tweaks before we hoist the flag and merge your contribution.

You have our heartfelt gratitude for lending a hand in enhancing the Fish Cookbook. We value your efforts, and together, we'll create a fantastic resource for the Fish community. Ahoy!

<h2></h2>

[![CC0](https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-nc-sa.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0)

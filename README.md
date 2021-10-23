# .dotfiles

The bare repository for config files.
This bare repository was created for the cross saving of linux and unix configuration dot files.
The following set of instructions creates a bare git repository for dotfiles that target a `.cfg` folder in the $HOME directory path. `.cfg` can be changed to any folder.

## How to start from scratch

First make sure github SSH is set up.
Then setup a bare repository.

[How to store dotfiles](https://www.atlassian.com/git/tutorials/dotfiles)

If you're running bash, the following is how to start:

```bash
git init --bare $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
```

Then ensure that a remote is setup

```bash
$ config remote add origin https://github.com/user/repo.git
# Set a new remote

$ config remote -v
# Verify new remote
> origin  https://github.com/user/repo.git (fetch)
> origin  https://github.com/user/repo.git (push)
```

Then start pushing to the remote

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

## Install stored files to new system

Ensure that the `config` is aliased

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

Ensure source repository ignores the folder to prevent recursion issues

```bash
echo ".cfg" >> .gitignore
```

The remote repository needs to be cloned into a "dot"

```bash
git clone --bare <git-repo-url> $HOME/.cfg
```

Alias the `config` command in the current shell

```bash
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

config checkout
```

This might happen after the git checkout.

```bash
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

The backup is required prior to checking out and overwriting existing profiles.

```bash
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

The untracked files should be shown to prevent the `$HOME` folder files from showing up during `config status`

```bash
config config --local status.showUntrackedFiles no
```

Dotfiles can be then updated as follows

```bash
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

## Setting up WSL

Windows Subsystem for Linux is absolutely amazing, and I assert is the most powerful development tool for Windows.

### Using wsl_setup.sh

Simple type `bash wsl_setup.sh` in a bash terminal after downloading my `wsl_setup.sh`

### Clipboard issues with vim

Using vim or nvim is very good for productivity in general as long as the setup is completed carefully. Since Linux is a subsytem, it should be carefully administered where a windows X server is required, along with vim with access to Windows' clipboard.
Refer to [this thread](https://github.com/Microsoft/WSL/issues/892#issuecomment-275873108).
In short:

1. Install [VcXsrv](https://sourceforge.net/projects/vcxsrv/)
2. If it starts after installing, stop it
3. Start it using XLaunch (search in the start menu), go with all the defaults (ensure the clipboard options are checked)
4. At the end, save the configuration to a file (use that to start it from now on)
5. Put `export DISPLAY=localhost:0.0` in your `.bashrc` in bash for Windows (and run the command in any open bash windows). The reason I explicitly say localhost is that this makes SSH X forwarding work, see below.
6. Ensure vim is installed using clipboard support. `vim --version | grep clipboard` should say `+clipboard`, not `-clipboard`. Also if you run the ex command `:echo has('clipboard')` in `vim` and it says `0` it does not have clipboard support compiled in. If you don't have clipboard support, install the `vim-gtk` package (`apt-get install vim-gtk`).
7. Put the `config` file into Startup folder to ensure an X server is launched on startup
8. Yanking from vim now should have access to `"*` and `"+` which also sends the yanks straight to the Windows system clipboard.

### wsltty

The default ubuntu terminal is well and good but fonts and graphics do not appear very well. The alternative is [wsltty](https://github.com/mintty/wsltty). This is just preference.

### Jupyter Notebook in WSL

Set up Windows Chrome browser in path

- Set up browser from `~/.bashrc` using `export BROWSER="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"`
- Set up `~/.bash_aliases` with `alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"`
- Generate, if not available, a jupyter notebook config file in terminal `jupyter notebook --generate-config`
- Naviage to the `.jupyter` directory and add the following to `jupyter_notebook_config.py`: `c.NotebookApp.browser = u'/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe %s'`
- Then add `c.NotebookApp.use_redirect_file = False`

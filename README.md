# zsh-gitcd

[![Author](https://img.shields.io/badge/Author-Sukka-b68469.svg?style=flat-square)](https://skk.moe)
[![License](https://img.shields.io/github/license/sukkaw/zsh-gitcd.svg?style=flat-square)](./LICENSE)

:nut_and_bolt: An [`oh-my-zsh`](https://ohmyz.sh/) plugin for `git clone && cd` under current directory.

## Installation

### oh-my-zsh

Firstly, clone this repository in `oh-my-zsh`'s plugins directory.

```bash
git clone https://github.com/sukkaw/zsh-gitcd.git ~/.oh-my-zsh/custom/plugins/zsh-gitcd
```

Secondly, activate the plugin in `~/.zshrc`. Enable it by adding `zsh-gitcd` to the [plugins array](https://github.com/robbyrussell/oh-my-zsh/blob/master/templates/zshrc.zsh-template#L66).

```
plugins=(
    [plugins
     ...]
    zsh-gitcd
)
```

### Antigen

[Antigen](https://github.com/zsh-users/antigen) is a zsh plugin manager, and it support `oh-my-zsh` plugin as well. You only need to add `antigen bundle sukkaw/zsh-gitcd` to your `.zshrc` with your other bundle commands if you are using Antigen. Antigen will handle cloning the plugin for you automatically the next time you start zsh. You can also add the plugin to a running zsh with `antigen bundle sukkaw/zsh-gitcd` for testing before adding it to your `.zshrc`.

----

Congratulations! Open a new terminal or run `source $HOME/.zshrc`.

## Usage

When target directory doesn't exist:

```bash
$ gitcd https://github.com/SukkaW/zsh-gitcd.git
Git cloning https://github.com/SukkaW/zsh-gitcd into zsh-gitcd...
Cloning into 'zsh-gitcd'...
remote: ....
remote: ....
Unpacking objects: .... , done.
You are now at zsh-gitcd.
```

When target directory already exists:

```bash
$ gitcd https://github.com/SukkaW/zsh-gitcd.git
zsh-gitcd already exists.
cd zsh-gitcd / delete zsh-gitcd && git clone [ y(default) / n ]: y
You are now at zsh-gitcd.

$ gitcd https://github.com/SukkaW/zsh-gitcd.git
zsh-gitcd already exists.
cd zsh-gitcd / delete zsh-gitcd && git clone [ y(default) / n ]: n
Deleting zsh-gitcd...
Git cloning https://github.com/SukkaW/zsh-gitcd into zsh-gitcd...
Cloning into 'zsh-gitcd'...
remote: ....
remote: ....
Unpacking objects: .... , done.
You are now at zsh-gitcd.
```

## Uninstallation

**If you install `zsh-gitcd` with Antigen**, you need to remove `antigen bundle sukkaw/zsh-gitcd` to disable the plugin.
**If you install `zsh-gitcd` with oh-myzsh**, you need to remove `zsh-gitcd` item from plugin array, then run `rm -rf ~/.oh-my-zsh/custom/plugins/zsh-gitcd` to remove the plugin.

## Author

**zsh-gitcd** © [Sukka](https://github.com/SukkaW), Released under the [MIT](https://github.com/SukkaW/zsh-gitcd/blob/master/LICENSE) License.<br>
Authored and maintained by Sukka with help from contributors ([list](https://github.com/SukkaW/zsh-gitcd/graphs/contributors)).

> [Personal Website](https://skk.moe) · [Blog](https://blog.skk.moe) · GitHub [@SukkaW](https://github.com/SukkaW) · Telegram Channel [@SukkaChannel](https://t.me/SukkaChannel) · Twitter [@isukkaw](https://twitter.com/isukkaw) · Keybase [@sukka](https://keybase.io/sukka)

# -------------------------------------------------
# zsh-gitcd
# Sukka (https://skk.moe)
# -------------------------------------------------

gitcd() {
    if [[ ! -n "$1" ]]; then
        print -P "%F{red}Please pass a git repo url when using gitcd!"
        return
    fi

    dir=$(__git_to_dir $1)

    [[ -d $dir ]] && {
        print -P "$dir %F{green}already exists.%F{reset}"
        print -P -n "%F{reset}cd $dir / delete $dir && git clone %F{green}[ %F{reset}y(default) %F{green}/%F{reset} n %F{green}]: %F{reset}"
        read __read_gitcd_option
        if [ ! -n "$__read_gitcd_option" ]; then
            __read_gitcd_option="y"
        fi

        if [ "${__read_gitcd_option}" = "y" ]; then
            cd $dir
            print -P "%F{green}You are now at %F{reset}$dir%F{green}.%F{reset}"
        else
            print -P "%F{blue}Deleting %F{reset}$dir%F{blue}...%F{reset}"
            rm -rf $dir
            print -P "%F{blue}Git cloning %F{reset}$1 %F{blue}into %F{reset}$dir%F{blue}...%F{reset}"
            git clone $1 $dir && cd $dir
            print -P "%F{green}You are now at %F{reset}$dir%F{green}.%F{reset}"
        fi

        return
    }

    print -P "%F{blue}Git cloning %F{reset}$1 %F{blue}into %F{reset}$dir%F{blue}...%F{reset}"
    git clone $1 $dir && cd $dir
    print -P "%F{green}You are now at %F{reset}$dir%F{green}.%F{reset}"
}

__git_to_dir() {
    # https://github.com/hexojs/hexo-deployer-git/blob/master/lib/parse_config.js
    url=$1
    # `git@`` || `https://sukkaw@` => ''
    url=${url#*@}
    # `ssh://` || `git://` || `git+https://` => ''
    url=${url#*://}
    # /.git$/ => ''
    url=${url%.git*}
    # host.com:foo/bar => host.com/foo/bar
    url=${url/:/\/}

    url=${url##*/}

    echo $url
}

__test_git_to_dir() {
    assert_ok() {
        [[ $1 == $2 ]] || {
            print -P "%B%F{red}Error:"
            print -P "%u%B%F{red}expect %b%f%U$1"
            print -P "%u%B%F{red}got    %b%f%U$2"
            return
        }
    }

    assert_ok $(__git_to_dir 'git://gitlab.com/edp/logger.git') 'logger'
    assert_ok $(__git_to_dir 'git@gitlab.com:edp/logger.git') 'logger'
    assert_ok $(__git_to_dir 'git://github.com/treygriffith/cellar.git') 'cellar'
    assert_ok $(__git_to_dir 'git@gitlab.xxx.com:frontend/arch/xxx.git') 'xxx'
    assert_ok $(__git_to_dir 'https://github.com/banchee/tranquil.git') 'tranquil'
    assert_ok $(__git_to_dir 'https://github.com/banchee/tranquil') 'tranquil'
    assert_ok $(__git_to_dir 'http://github.com/banchee/tranquil.git') 'tranquil'
    assert_ok $(__git_to_dir 'git+https://github.com/banchee/tranquil.git') 'tranquil'
    assert_ok $(__git_to_dir 'github.com/banchee/tranquil.git') 'tranquil'
    assert_ok $(__git_to_dir 'https://jpillora@github.com/banchee/tranquil.git') 'tranquil'
    assert_ok $(__git_to_dir 'git@github.com:cnpm/cnpm.git') 'cnpm'
    assert_ok $(__git_to_dir 'github.com:cnpm/cnpm.git') 'cnpm'
    assert_ok $(__git_to_dir 'git@github.com:cnpm/cnpm') 'cnpm'
    assert_ok $(__git_to_dir 'git@gitcafe.com:fengmk2/cnpm.git') 'cnpm'
    assert_ok $(__git_to_dir 'git@gist.github.com:3135914.git') '3135914'

    print -P "%B%F{green}All Unit Test Passed!"
}
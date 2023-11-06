function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __git_cb
        set __git_cb (set_color brown)"("(git branch 2>/dev/null | grep \* | sed 's/* //')")"(set_color normal)""
    end

    switch $USER

        case root

        if not set -q __fish_prompt_cwd
            if set -q fish_color_cwd_root
                set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
            else
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end
        end

        printf '%s@%s:%s%s%s%s# ' $USER $__fish_prompt_hostname "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

        case '*'

        if not set -q __fish_prompt_cwd
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end

        printf '%s%s %s\n%s%s$ ' (date "+%m/%d %T") "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb
    end
end

set -x WORKSPACE ~/Developer

# Alias
function pe
    subl ~/.config/fish/config.fish
end
function ws
    cd $WORKSPACE
end

## git alias
function gs
    git status
end
function gc
    git checkout
end
function gb
    git branch
end

function sudo
    if test "$argv" = !!
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function cleanbranch
  git checkout master
  git branch --list | grep "^[^*]" | xargs git branch -D
end

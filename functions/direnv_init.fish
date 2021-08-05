function direnv_init -d 'Initialize direnv'
    if not type direnv >/dev/null 2>&1
        set -l filename (basename (status -f))
        echo $filename: (set_color red)direnv executable is not found.(set_color normal)
        return 1
    end

    eval (direnv hook fish)

    # wrap tmux to avoid issues with environment loading
    if type tmux >/dev/null 2>&1
        alias tmux 'direnv exec / tmux'
    end
end

function direnv_init -d 'Initialize direnv'
    if not type direnv >/dev/null ^/dev/null
        set -l filename (basename (status -f))
        echo $filename: (set_color red)direnv executable is not found.(set_color normal)
        return 1
    end

    eval (direnv hook fish)

    # wrap tmux to avoid issues with environment loading
    if type tmux >/dev/null ^/dev/null
        alias tmux 'direnv exec / tmux'
    end
end

function fish_prompt
    set -l cwd (pwd)
    set -l display

    if test (string length -- "$cwd") -gt 30
        set display (basename -- "$cwd")
    else
        set display "$USER@$hostname "(string replace -r "^$HOME" "~" -- "$cwd")
    end

    set -l git_part ""
    set -l branch (git branch --show-current 2>/dev/null)
    if test -n "$branch"
        set git_part " "(set_color blue)"($branch)"(set_color normal)
    end

    echo -n "[$display$git_part]"
    echo -n '$ '
end

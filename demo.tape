# Render from the repo root:  vhs demo/demo.tape
# Uses demo/hosts.conf (made-up hosts), so your real ~/.ssh/config never shows up.

Output demo/sshpick.gif

Require fzf
Require jq

Set Shell bash
Set Theme "Catppuccin Mocha"
Set FontSize 18
Set Width 1400
Set Height 820
Set Padding 24
Set TypingSpeed 70ms
Set WaitTimeout 20s

Env USER alex
Env SSHPICK_CONFIG demo/ssh_config

Hide
Type `cp demo/hosts.conf demo/ssh_config && export PATH="$PWD:$PATH" PS1='$ ' && clear`
Enter
Sleep 500ms
Show

# Open the picker
Type "sshpick --here"
Sleep 400ms
Enter
Wait+Screen /add new host/
Sleep 1.5s

# Browse: the details pane follows the cursor (db-prod goes through a jump host)
Down
Sleep 1.2s
Down
Sleep 700ms
Down
Sleep 700ms
Down
Sleep 1s

# Fuzzy search matches aliases, tags, users and addresses
Type "homelab"
Sleep 1.5s
Ctrl+U
Type "pi"
Sleep 1.5s
Ctrl+U
Type "tokyo"
Sleep 1.5s
Ctrl+U
Sleep 500ms

# Add a host with the step-by-step form
Ctrl+N
Wait+Screen /Add host/
Sleep 800ms
Type "minecraft"
Sleep 400ms
Enter
Type "198.51.100.42"
Sleep 400ms
Enter
Ctrl+U
Type "steam"
Sleep 400ms
Enter
Sleep 400ms
Enter
Type "homelab"
Sleep 400ms
Enter
Sleep 600ms
Enter

# sshpick checks the host before you rely on it (this one is made up, so it fails)
Wait+Screen /Keep anyway/
Sleep 2s
Down
Sleep 300ms
Down
Sleep 600ms
Enter

# It's in the list, tagged homelab
Wait+Screen /add new host/
Type "mine"
Sleep 1.5s

# Delete it again
Ctrl+D
Wait+Screen /Delete/
Sleep 800ms
Down
Sleep 600ms
Enter
Sleep 1.2s
Ctrl+U
Sleep 1.5s

Escape
Sleep 500ms

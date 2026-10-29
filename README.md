# sshpick

A floating SSH host picker for [Rex](https://www.superlogical.com/rex). Press a key, choose a host from your `~/.ssh/config`, and land in a new tab named after that host, grouped into a Rex session by tag.

Hosts are added, checked, and deleted from the same popup, so you never have to edit `~/.ssh/config` by hand.

![sshpick demo](demo/sshpick.gif)

## What it does

- **Opens as a floating popup** over your current Rex tab, with no new tab or split.
- **Reads your existing `~/.ssh/config`** (and `~/.ssh/config.d/*`). There's no separate host database.
- **Fuzzy search** across every host, with a details pane for the highlighted one.
- **Tags group your hosts.** Click a tag to filter the list. Each tag is also a Rex session: connecting to a `homelab` host opens a tab in your `homelab` session and creates the session if needed. Untagged hosts go to a session named `ssh`.
- **Names each tab after the host alias.**
- **Add a host** with a step-by-step form (alias, hostname, user, port, tag, key). sshpick writes it to your config, then checks that the port is open and that key login works. If key login fails, it offers to run `ssh-copy-id` for you.
- **Delete a host** with `ctrl-d`. Your config is backed up to `~/.ssh/config.bak` first.

## Requirements

- **macOS** with **Rex** installed
- **fzf 0.65 or newer**: `brew install fzf`
- **jq**: preinstalled on recent macOS, or `brew install jq`
- **OpenSSH 9.4 or newer**, for the `Tag` keyword. Recent macOS already has it; check with `ssh -V`.

## Install

1. Put the script on your `PATH`:

   ```sh
   curl -fsSL --create-dirs -o ~/.local/bin/sshpick https://raw.githubusercontent.com/calvindotnow/sshpick/main/sshpick && chmod +x ~/.local/bin/sshpick
   ```

   Make sure `~/.local/bin` is on your `PATH`.

2. Add a keyboard shortcut (optional, but recommended). Paste the contents of [`sshpick.lua`](sshpick.lua) into `~/.config/rex/init.lua`, then reload your Rex config. This binds **⌘⇧S** and adds **SSH: Pick Host** to the command palette.

3. Turn on **Remote Control** in **Rex Settings › Rex Server**. sshpick needs it to switch you to the new session after you connect. Without it the connection still opens, but you have to switch to it yourself.

## Use

Press **⌘⇧S**, or type `sshpick` in any Rex terminal.

| Key | Action |
| --- | --- |
| type | fuzzy search hosts |
| `enter` | connect to the highlighted host |
| `ctrl-n` | add a new host |
| `ctrl-d` | delete the highlighted host |
| click a tag | filter by tag (`all` to reset) |
| `esc` | close the picker |

In the add-host form, `enter` moves to the next field and `shift-tab` goes back. After the last field, sshpick saves the host and checks the connection.

### Tagging hosts

Put a `Tag` line on any host in `~/.ssh/config` (or fill in the Tag field when you add a host):

```sshconfig
Host media
    HostName 192.168.1.20
    User root
    Tag homelab
```

### Options

- `sshpick --here` runs the picker in the current terminal instead of a popup.
- `SSHPICK_CONFIG=/path/to/ssh_config` uses that file instead of `~/.ssh/config`, both for listing hosts and for connecting.
- `SSHPICK_BOUNDS="0.2,0.15,0.6,0.6"` sets the popup's position and size as x, y, width, and height, each a fraction of the window. For the ⌘⇧S shortcut, change `bounds` in `init.lua` instead.

## Re-recording the demo

The GIF is generated with [VHS](https://github.com/charmbracelet/vhs) from [`demo/demo.tape`](demo/demo.tape), using the made-up hosts in [`demo/hosts.conf`](demo/hosts.conf). From the repo root:

```sh
vhs demo/demo.tape
```

## Notes and limitations

- Delete only removes hosts from `~/.ssh/config`, not from files in `~/.ssh/config.d/`.
- Hosts with wildcards (`Host *`, `Host *.internal`) are skipped, since you can't connect to them directly.
- Rex is new and its API may change. If something breaks after a Rex update, please open an issue.

## License

MIT

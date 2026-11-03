# Changelog

## Unreleased

- Adding a host: the tag step lists your existing tags to pick from with ↑↓, or type a new one.
- Adding a host: the hostname field is now labeled "IP address (or domain name)".
- Adding a host: the user field starts empty instead of your local username. Leave it blank to use ssh's default.

## 0.2.0

- Favorites (`ctrl-f`) stay at the top of the list.
- Hosts are sorted by when you last connected, or A–Z (`ctrl-o`).
- Enter jumps to a host's tab if it's already open. `alt-enter` opens a new tab anyway. The details pane shows when a tab is open.
- When a connection drops, the tab offers to reconnect instead of sitting there dead. A normal logout closes the tab.
- Works without Rex: outside Rex (or with `--inline`), the picker opens below your prompt and connects with `ssh` in the same terminal. Only fzf is required.
- `tab` and `shift-tab` cycle through tags.
- Edit hosts that sshpick added (`ctrl-e`). New hosts are marked with an `# added by sshpick` comment.
- Hosts from `Include`d config files are listed.
- Deleting a host from an `Include`d file explains where it lives instead of failing silently.
- The host list is built once per run, so starring, sorting, and filtering are much faster with many hosts.
- `sshpick --version` and `sshpick --update`.

## 0.1.0

- First release: floating picker, tags as Rex sessions, add with connection check, delete.

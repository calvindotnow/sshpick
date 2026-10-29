-- sshpick for Rex: add this to ~/.config/rex/init.lua (adjust the path if you installed elsewhere)
rex.action{
  name     = "sshpick",
  title    = "SSH: Pick Host",
  keywords = "ssh connect host",
  run = function(ctx)
    local _, err = rex.session.new_layer{
      bounds = { 0.15, 0.12, 0.7, 0.7 },  -- x, y, w, h as fractions of the window
      focus  = true,
      layout = rex.layout.block{
        flavor  = "com.superlogical.terminal.shell",
        options = { command = { os.getenv("HOME") .. "/.local/bin/sshpick", "--here" } },
      },
    }
    if err then rex.log("error", "sshpick: " .. err) end
  end,
}
rex.bind("cmd+shift+s", "sshpick")

local logo = [[
████████  ██████   █████  ███████ ████████ ██    ██ ██ ███    ███ 
   ██    ██    ██ ██   ██ ██         ██    ██    ██ ██ ████  ████ 
   ██    ██    ██ ███████ ███████    ██    ██    ██ ██ ██ ████ ██ 
   ██    ██    ██ ██   ██      ██    ██     ██  ██  ██ ██  ██  ██ 
   ██     ██████  ██   ██ ███████    ██      ████   ██ ██      ██ 
                                                                  
                                                                  
 ]]
return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = logo,
      },
      sections = {
        {section = "header"},
        {section = "startup", padding = 1},
        {icon = " ", title = "Git Status", section = "terminal", enabled = function() return Snacks.git.get_root() ~= nil end, cmd = "git status --short --branch --renames", height = 5, padding = 1, ttl = 5 * 60, indent = 3, },
        {icon = " ", title = "Git Diff", section = "terminal", enabled = function() return Snacks.git.get_root() ~= nil end, cmd = "git --no-pager diff --stat -B -M -C", height = 10, padding = 1, ttl = 5 * 60, indent = 3, },
      }
    },
  },
}

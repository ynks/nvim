local path = vim.fn.stdpath("config") .. "/lua/keybinds"

for name, type in vim.fs.dir(path) do
	if type == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
		require("keybinds." .. name:sub(1, -5))
	end
end

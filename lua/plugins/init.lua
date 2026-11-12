local path = vim.fn.stdpath("config") .. "/lua/plugins"

for name, type in vim.fs.dir(path) do
	if type == "file" and name:sub(-4) == ".lua" and name ~= "init.lua" then
		require("plugins." .. name:sub(1, -5))
	end
end

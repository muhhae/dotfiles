package.path = package.path
	.. ";/usr/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?.lua;/usr/local/share/lua/5.4/?/init.lua;/usr/share/lua/5.4/?/init.lua;/usr/local/lib/lua/5.4/?.lua;/usr/local/lib/lua/5.4/?/init.lua;/usr/lib/lua/5.4/?.lua;/usr/lib/lua/5.4/?/init.lua;./?.lua;./?/init.lua;/home/muhhae/.luarocks/share/lua/5.4/?.lua;/home/muhhae/.luarocks/share/lua/5.4/?/init.lua"
package.cpath = package.cpath
	.. ";/usr/local/lib/lua/5.4/?.so;/usr/lib/lua/5.4/?.so;/usr/local/lib/lua/5.4/loadall.so;/usr/lib/lua/5.4/loadall.so;./?.so;/home/muhhae/.luarocks/lib/lua/5.4/?.so"

require("config.remap")
require("config.packer")
require("config.set")
require("config.autocmd")

if vim.g.neovide == true then
	require("config.neovide")
end

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.termguicolors = true

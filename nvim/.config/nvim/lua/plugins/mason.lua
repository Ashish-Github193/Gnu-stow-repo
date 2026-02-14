require("mason").setup()

local ensure_installed = {
	"stylua",
	"black",
	"isort",
	"prettierd",
	"prettier",
	"shfmt",
	"taplo",
}

local mr = require("mason-registry")
mr.refresh(function()
	for _, tool in ipairs(ensure_installed) do
		local p = mr.get_package(tool)
		if not p:is_installed() then
			p:install()
		end
	end
end)

local server = require("nvim-lsp-installer.server")
local shell = require("nvim-lsp-installer.installers.shell")

return function(name, root_dir)
    return server.Server:new({
        name = name,
        root_dir = root_dir,
        homepage = "https://github.com/tamasfe/taplo",
        languages = { "toml" },
        installer = shell.bash("cargo install taplo-lsp"),
        default_options = {
            cmd = { shell.bash("taplo-lsp run") },
        },
    })
end

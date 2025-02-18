local server = require "nvim-lsp-installer.server"
local npm = require "nvim-lsp-installer.installers.npm"

return function(name, root_dir)
    return server.Server:new {
        name = name,
        root_dir = root_dir,
        homepage = "https://github.com/znck/grammarly",
        languages = {},
        installer = npm.packages { "@emacs-grammarly/unofficial-grammarly-language-server" },
        default_options = {
            cmd = {
                npm.executable(root_dir, "unofficial-grammarly-language-server"),
                "--stdio",
            },
        },
    }
end

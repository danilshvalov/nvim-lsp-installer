local installers = require "nvim-lsp-installer.installers"
local path = require "nvim-lsp-installer.path"
local server = require "nvim-lsp-installer.server"
local composer = require "nvim-lsp-installer.installers.composer"
local std = require "nvim-lsp-installer.installers.std"
local process = require "nvim-lsp-installer.process"

return function(name, root_dir)
    return server.Server:new {
        name = name,
        root_dir = root_dir,
        homepage = "https://phpactor.readthedocs.io/en/master/",
        languages = { "php" },
        installer = installers.when {
            unix = {
                std.git_clone "https://github.com/phpactor/phpactor.git",
                composer.install(),
            },
        },
        default_options = {
            cmd_env = {
                PATH = process.extend_path {
                    path.concat { root_dir, "bin" },
                },
            },
        },
    }
end

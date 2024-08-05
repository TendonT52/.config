local lsp = vim.lsp

local make_client_capabilities = lsp.protocol.make_client_capabilities
function lsp.protocol.make_client_capabilities()
	local caps = make_client_capabilities()
	caps.workspace.didChangeWatchedFiles = nil

	return caps
end

require("tendont52.core")
require("tendont52.lazy")

local ok, dap = pcall(require, "dap")

if not ok then
	print("could not load dap")
else
	local dapui = require("dapui")
    local dapvt = require('nvim-dap-virtual-text')
	dapui.setup()
	dap.listeners.after.event_initialized["dapui_config"] = function()
		dapui.open()
	end
	dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
	dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end
	dapvt.setup({})

	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, opts)
	vim.keymap.set("n", "<space>dv", function()
		vim.ui.input({ prompt = "Breakpoint condition" }, dap.set_breakpoint)
	end, opts)
	vim.keymap.set("n", "<space>dl", function()
		vim.ui.input({ prompt = "Log point message: " }, function(msg)
			dap.set_breakpoint(nil, nil, msg)
		end)
	end, opts)
	vim.keymap.set("n", "<space>dc", dap.continue, opts)
	vim.keymap.set("n", "<space>di", dap.step_into, opts)
	vim.keymap.set("n", "<space>ds", dap.step_over, opts)
	vim.keymap.set("n", "<space>do", dap.step_out, opts)
	vim.keymap.set("n", "<space>dt", dap.terminate, opts)
	vim.keymap.set("n", "<space>du", function()
		dapui.toggle()
	end, opts)
end

 -- Opening the terminal
vim.api.nvim_create_user_command('FTermOpen', require('FTerm').open, { bang = true })

-- CLosing the terminal
vim.api.nvim_create_user_command('FTermClose', require('FTerm').close, { bang = true })

-- Exiting the terminal
vim.api.nvim_create_user_command('FTermExit', require('FTerm').exit, { bang = true })

-- Toggling the terminal
vim.api.nvim_create_user_command('FTermToggle', require('FTerm').toggle, { bang = true })

vim.g.mapleader = " "

P = function(f)
  vim.print(vim.inspect(f))
  return f
end

local keymap = vim.keymap -- for conciseness

-- Neovim
keymap.set("n", "<esc>", "<cmd>nohl<cr>")
keymap.set("n", "<C-q>", "<cmd>qa!<CR>", { desc = "Close Neovim" })
keymap.set("n", "<leader>w", "<cmd>wa<CR>", { desc = "Save Changes" })

-- disable updating register for x and c
keymap.set("n", "x", '"_x')
keymap.set("v", "c", '"_c')
keymap.set("n", "C", '"_C')

-- window management
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Change window to right" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Change window to left" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Change window to bottom" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Change window to top" })
keymap.set("n", "<C-x>", "<cmd>close<CR>", { desc = "Close current split" })

-- splits management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })

-- resize with arrows
keymap.set("n", "<A-Down>", "<cmd>resize -4<cr>", { desc = "Smaller horizontal split" })
keymap.set("n", "<A-Up>", "<cmd>resize +4<cr>", { desc = "Bigger horizontal split" })
keymap.set("n", "<A-Left>", "<cmd>vertical resize -4<cr>", { desc = "Smaller vertical split" })
keymap.set("n", "<A-Right>", "<cmd>vertical resize +4<cr>", { desc = "Bigger vertical split" })

-- tabs management
keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>td", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "[t", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "]t", "<cmd>tabp<CR>", { desc = "Go to previous tab" })

-- buffers management
keymap.set("n", "<C-]>", "<cmd>bn<CR>", { desc = "Go to next buffer" })
keymap.set("n", "<C-[>", "<cmd>bp<CR>", { desc = "Go to previous buffer" })
keymap.set("n", "<leader>bn", "<cmd>new<CR>", { desc = "New buffer" })
keymap.set("n", "<leader>bd", "<cmd>bd<CR>", { desc = "Close current buffer" })
keymap.set("n", "<leader>bx", "<cmd>%bd|e#|bd#<CR>", { desc = "Close all buffers but this" })

-- copy & paste
keymap.set("x", "p", '"_dP')
keymap.set("x", "Y", "y$", { desc = "Yank to end of line" })
keymap.set("n", "<leader>DD", '"_dd', { desc = "Delete without changing register" })
keymap.set("v", "<leader>DD", '"_dd', { desc = "Delete without changing register" })

-- scrolling
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

-- indenting
keymap.set("v", "<s-tab>", "<gv", { desc = "Indent left" })
keymap.set("v", "<tab>", ">gv", { desc = "Indent right" })
keymap.set("n", "<s-tab>", "<<", { desc = "Indent left" })
keymap.set("n", "<tab>", ">>", { desc = "Indent right" })

-- moving blocks up and down
keymap.set("v", "<C-g>", "<cmd>m .+1<CR>gv=gv", { desc = "Move text down" })
keymap.set("v", "<C-t>", "<cmd>m .-2<CR>gv=gv", { desc = "Move text up" })

-- other
keymap.set("n", "<leader>mm", "<cmd>messages<cr>", { desc = "Show messages" })
keymap.set("n", "}", '<cmd>execute "keepjumps norm! }"<cr>', { desc = "Next Paragraph" })
keymap.set("n", "{", '<cmd>execute "keepjumps norm! {"<cr>', { desc = "Previous Paragraph" })

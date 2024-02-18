require("ocrap.remap")
require("ocrap.set")

require("nvim-surround").setup({
    keymaps = {
        normal = "ms",
        normal_cur = "mss",
        normal_line = "mS",
        normal_cur_line = "mSS",
    }
})

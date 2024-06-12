return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
     filesystem = {
        follow_current_file = { enabled = false },
        bind_to_cwd = true,
        window = {
          mappings = {
            ["/"] = "none",
          },
        },
      },
    },
  },
}

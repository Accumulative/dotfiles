function execute(op, path)
  require("nvim-projectconfig").load_project_config()
  if vim.fn.filereadable("./.env") == 0 then
    local handle = io.popen("git worktree list | grep -v wt | awk '{print $1}' | xargs -I '{}' echo '{}/.env'")
    local result = handle:read("*a")
    handle:close()
    local envpath = result:gsub("^%s*(.-)%s*$", "%1")
    if vim.fn.filereadable(envpath) == 1 then
      os.execute("cp " .. envpath .. " ./.env")
    end
  end
end

return {
  "theprimeagen/git-worktree.nvim",
  config = function()
    local Worktree = require("git-worktree")
    Worktree.on_tree_change(function(
      op,
      path,
      _ --[[upstream]]
    )
      execute(op, path.path)
    end)
  end,
}

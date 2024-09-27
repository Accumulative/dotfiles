return {
  "tpope/vim-projectionist",
  config = function()
    -- typescript
    local extensions = { ".ts", ".js" }
    local config = {}
    for i, ex in pairs(extensions) do
      local alternate1 = {}
      local alternate2 = {}
      for j, ex2 in pairs(extensions) do
        table.insert(alternate1, "src/{}.spec" .. ex2)
        table.insert(alternate2, "src/{}" .. ex2)
      end
      config["src/*" .. ex] = {
        alternate = alternate1,
        type = "test",
      }
      config["src/*.spec" .. ex] = {
        alternate = alternate2,
        type = "source",
      }
    end

    -- c++
    config["src/*.cpp"] = {
      type = "source",
      alternate = "src/{}.hpp",
    }
    config["src/*.hpp"] = {
      type = "header",
      alternate = "src/{}.cpp",
    }

    vim.g.projectionist_heuristics = { ["*"] = config }
  end,
}

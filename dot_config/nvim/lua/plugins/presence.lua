local open_repository_label = "Open Repository"
local github = {
  label = "Open GitHub Profile",
  url = "https://github.com/xsu1010",
}

return {
  {
    "jiriks74/presence.nvim",
    event = "UIEnter",
    opts = {
      neovim_image_text = "nvim btw",
      main_image = "neovim",
      -- log_level = "debug",
      buttons = function(buffer, repo_url)
        if repo_url ~= nil then
          if string.find(repo_url, "bmw") then
            -- shhhhhh
            return {
              {
                label = open_repository_label,
                url = "https://bmw.pt",
              },
              github,
            }
          else
            -- vim.notify(repo_url)
            -- convert ssh to https so that presence works
            if string.find(repo_url, "git@") then
              -- replace ONLY the first occurence of "git@" with "https://"
              repo_url = repo_url:gsub("git@", "https:///", 1)
              repo_url = repo_url:gsub(".com:", ".com/")
            end
            return {
              {
                label = open_repository_label,
                url = repo_url,
              },
              github,
            }
          end
        else
          -- return my github
          return {
            github,
          }
        end
      end,
    },
  },
}

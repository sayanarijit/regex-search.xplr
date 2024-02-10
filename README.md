# regex-search.xplr

Since version `v0.19.4`, xplr search will default to [native fuzzy matching](https://github.com/sayanarijit/xplr/pull/511).

This plugin is for people who prefer the old regex based filtered search because it
allows more control for advanced use cases.

## Installation

### Install manually

- Add the following line in `~/.config/xplr/init.lua`

  ```lua
  local home = os.getenv("HOME")
  package.path = home
    .. "/.config/xplr/plugins/?/init.lua;"
    .. home
    .. "/.config/xplr/plugins/?.lua;"
    .. package.path
  ```

- Clone the plugin

  ```bash
  mkdir -p ~/.config/xplr/plugins

  git clone https://github.com/sayanarijit/regex-search.xplr ~/.config/xplr/plugins/regex-search
  ```

- Require the module in `~/.config/xplr/init.lua`

  ```lua
  require("regex-search").setup()

  -- Or

  require("regex-search").setup{
    mode = "default",  -- or xplr.config.modes.builtin.default
    key = "/",  -- or xplr.config.modes.builtin.default.key_bindings.on_key["/"]
    prompt = "/",
    initial_input = "(?i)^",
  }

  -- Type `/` and then the pattern to match
  ```

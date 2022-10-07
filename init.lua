---@diagnostic disable
local xplr = xplr
---@diagnostic enable

local function setup(args)
  args = args or {}
  args.mode = args.mode or "default"

  if type(args.mode) == "string" then
    args.mode = xplr.config.modes.builtin[args.mode]
  end

  args.key = args.key or "/"

  if type(args.key) == "string" then
    if args.mode.key_bindings.on_key[args.key] == nil then
      args.mode.key_bindings.on_key[args.key] = {}
    end
    args.key = args.mode.key_bindings.on_key[args.key]
  end

  args.prompt = args.prompt or "/"
  args.initial_input = args.initial_input or "(?i)^"

  args.key.help = "regex search"
  args.key.messages = {
    "PopMode",
    { SwitchModeCustom = "regex_search" },
    { SetInputBuffer = args.initial_input },
    { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
    "ExplorePwdAsync",
  }

  xplr.config.modes.custom.regex_search = {
    name = "regex search",
    prompt = args.prompt,
    key_bindings = {
      on_key = {
        down = {
          help = "down",
          messages = {
            "FocusNext",
          },
        },
        enter = {
          help = "submit",
          messages = {
            { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
            "PopMode",
            "ExplorePwdAsync",
          },
        },
        right = {
          help = "enter",
          messages = {
            { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
            "Enter",
            { SetInputBuffer = args.initial_input },
            "ExplorePwdAsync",
          },
        },
        left = {
          help = "back",
          messages = {
            { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
            "Back",
            { SetInputBuffer = args.initial_input },
            "ExplorePwdAsync",
          },
        },
        tab = {
          help = "toggle selection",
          messages = {
            "ToggleSelection",
            "FocusNext",
          },
        },
        up = {
          help = "up",
          messages = {
            "FocusPrevious",
          },
        },
      },
      default = {
        messages = {
          { RemoveNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "UpdateInputBufferFromKey",
          { AddNodeFilterFromInput = "RelativePathDoesMatchRegex" },
          "ExplorePwdAsync",
        },
      },
    },
  }
end

return { setup = setup }

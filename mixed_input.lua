local game_name = reframework:get_game_name()

local function postHIDManager()
  local hid_manager = sdk.get_managed_singleton(sdk.game_namespace("HIDManager"))

  if game_name == "re7" then
    if hid_manager:get_field("<inputMode>k__BackingField") == 0 then
      hid_manager:set_field("<inputMode>k__BackingField", 1)
    end
  end

  if game_name == "re8" then
    local inputMode = hid_manager:call("get_inputMode")
    if inputMode.V == 1 then
      inputMode.V = 0
    end
  end
end

local function postInputSystem()
  local input_system = sdk.get_managed_singleton(sdk.game_namespace("InputSystem"))
  local inputMode = input_system:call("get_InputMode")

  if inputMode == 1 then
    inputMode = 0
  end
end

if game_name == "re7" or game_name == "re8" then
  sdk.hook(
    sdk.find_type_definition(sdk.game_namespace("HIDManager")):get_method("doUpdate"),
    nil,
    postHIDManager
  )
end

if game_name == "re2" or game_name == "re3" then
  sdk.hook(
    sdk.find_type_definition(sdk.game_namespace("InputSystem")):get_method("update"),
    nil,
    postInputSystem
  )
end

local is_re7 = reframework:get_game_name() == "re7"
local is_re2 = reframework:get_game_name() == "re2"
local is_re3 = reframework:get_game_name() == "re3"
local is_re8 = reframework:get_game_name() == "re8"

if not is_re7 and not is_re2 and not is_re3 and not is_re8 then
  return
end
log.info("[kbm_emulation.lua] loaded")

local function postHIDManager()
  local hid_manager = sdk.get_managed_singleton(sdk.game_namespace("HIDManager"))

  if is_re7 then
    if hid_manager:get_field("<inputMode>k__BackingField") == 0 then
      hid_manager:set_field("<inputMode>k__BackingField", 1)
    end
  end

  if is_re8 then
    if hid_manager:get_field("<inputMode>k__BackingField"):get_field("V") == 0 then
      hid_manager:get_field("<inputMode>k__BackingField"):set_field("V", 1)
    end
  end
end

local function postInputSystem()
  local input_system = sdk.get_managed_singleton(sdk.game_namespace("InputSystem"))
end

if is_re7 or is_re8 then
  sdk.hook(sdk.find_type_definition(sdk.game_namespace("HIDManager")):get_method("doUpdate"), nil, postHIDManager)
end

if is_re2 or is_re3 then
  sdk.hook(sdk.find_type_definition(sdk.game_namespace("InputSystem")):get_method("update"), nil, postInputSystem)
end

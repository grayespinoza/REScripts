local game_name = reframework:get_game_name()

local is_re7 = game_name == "re7"
local is_re8 = game_name == "re8"

if not is_re7 and not is_re8 then
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

if is_re7 or is_re8 then
  sdk.hook(sdk.find_type_definition(sdk.game_namespace("HIDManager")):get_method("doUpdate"), nil, postHIDManager)
end

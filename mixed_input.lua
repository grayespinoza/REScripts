local game_name = reframework:get_game_name()

local function postUpdate()
  local input_system = sdk.get_managed_singleton(sdk.game_namespace("InputSystem"))
  local inputMode = input_system:call("get_InputMode")

  if inputMode == 1 then
    inputMode = 0
  end
end

if game_name == "re2" or game_name == "re3" then
  sdk.hook(
    sdk.find_type_definition(sdk.game_namespace("InputSystem")):get_method("update"),
    nil,
    postUpdate
  )
end

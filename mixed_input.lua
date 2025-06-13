local game_name = reframework:get_game_name()

local function postUpdate()
  -- Input Device Manager for RE2
  if game_name == "re2" then
    input_system = sdk.get_managed_singleton("app.ropeway.InputSystem")
  end

  -- Input Device Manager for RE3
  if game_name == "re3" then
    input_system = sdk.get_managed_singleton("offline.InputSystem")
  end

  local inputMode = input_system:call("get_InputMode")
  if inputMode == 1 then
    inputMode = 0
  end
end

if game_name == "re2" then
  sdk.hook(
    sdk.find_type_definition("app.ropeway.InputSystem"):get_method("update"),
    nil,
    postUpdate
  )
end

if game_name == "re3" then
  sdk.hook(
    sdk.find_type_definition("offline.InputSystem"):get_method("update"),
    nil,
    postUpdate
  )
end

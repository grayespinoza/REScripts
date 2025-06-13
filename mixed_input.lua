local game_name = reframework:get_game_name()

-- Input Device Manager for RE2 and RE3
if game_name == "re2" or game_name == "re3" then
  local function onUpdate()
    local input_system = sdk.get_managed_singleton("offline.InputSystem")
    local inputMode = input_system:call("get_InputMode")

    if inputMode ~= nil and inputMode == 1 then
      input_system:call("set_InputMode", 0)
    end
  end

  sdk.hook(
    sdk.find_type_definition("offline.InputSystem"):get_method("update"),
    nil,
    onUpdate
  )
end

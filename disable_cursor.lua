re.on_pre_gui_draw_element(function(element, context)
  local game_object = element:call("get_GameObject")
  if game_object == nil then return true end

  local name = game_object:call("get_Name")
  if name == "Gui_ui0300" then
    return false
  end

  return true
end)

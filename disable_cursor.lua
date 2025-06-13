re.on_pre_gui_draw_element(function(element, context)
  local game_object = element:call("get_GameObject")
  if game_object == nil then return true end

  local name = game_object:call("get_Name")

  -- Cursor for RE7
  if name == "MouseCursorGUI" then
    return false
  end

  -- Cursor for RE2 and RE3
  if name == "GUI_MouseCursor" then
    return false
  end

  -- Cursor for RE4
  if name == "Gui_ui0300" then
    return false
  end

  return true
end)

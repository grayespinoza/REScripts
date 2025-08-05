local game_name = reframework:get_game_name()

local is_re7 = game_name == "re7"
local is_re2 = game_name == "re2"
local is_re3 = game_name == "re3"
local is_re8 = game_name == "re8"
local is_re4 = game_name == "re4"

if not is_re7 and not is_re2 and not is_re3 and not is_re8 and not is_re4 then
  return
end
log.info("[disable_cursor.lua] loaded")

re.on_pre_gui_draw_element(function(element, context)
  local game_object = element:call("get_GameObject")
  if game_object == nil then
    return true
  end
  local name = game_object:call("get_Name")

  -- Cursor for RE7
  if is_re7 then
    if name == "MouseCursorGUI" then
      return false
    end
  end

  -- Cursor for RE2 and RE3
  if is_re2 or is_re3 then
    if name == "GUI_MouseCursor" then
      return false
    end
  end

  -- Cursor for RE8
  if is_re8 then
    if name == "GUIMouseCursor" then
      return false
    end
  end

  -- Cursor for RE4
  if is_re4 then
    if name == "Gui_ui0300" then
      return false
    end
  end

  return true
end)

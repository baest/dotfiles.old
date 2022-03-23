local function focus_other_screen(name) -- focuses the other screen 
   local screen = hs.mouse.getCurrentScreen()
   local nextScreen

   if name == "prev" then
       nextScreen = screen:previous()
   elseif name == "next" then
       nextScreen = screen:next()
   else
       nextScreen = hs.screen.find(name)
   end

   local rect = nextScreen:fullFrame()
   local center = hs.geometry.rectMidPoint(rect)
   hs.mouse.absolutePosition(center)
end

function get_window_under_mouse() -- from https://gist.github.com/kizzx2/e542fa74b80b7563045a
   local my_pos = hs.geometry.new(hs.mouse.absolutePosition())
   local my_screen = hs.mouse.getCurrentScreen()
   return hs.fnutils.find(hs.window.orderedWindows(), function(w)
                 return my_screen == w:screen() and my_pos:inside(w:frame())
   end)
end

function activate_other_screen(name)
   focus_other_screen(name)
   local win = get_window_under_mouse()
   -- now activate that window
   win:focus()
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

--hs.hotkey.bind({"ctrl"}, "pad0", function() -- does the keybinding
--      activate_other_screen('Color LCD')
--end)
--hs.hotkey.bind({"ctrl"}, "pad1", function() -- does the keybinding
--      activate_other_screen('S27D850')
--end)
--hs.hotkey.bind({"ctrl"}, "pad2", function() -- does the keybinding
--      activate_other_screen('S27H85x')
--end)
hs.hotkey.bind({"alt","command"}, "left", function() -- does the keybinding
      activate_other_screen('next')
end)
hs.hotkey.bind({"alt","command"}, "right", function() -- does the keybinding
      activate_other_screen('prev')
end)

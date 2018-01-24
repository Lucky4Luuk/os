local os = {}

function loadSettings()
  --Process the settings
  local lines = filesystem.lines_from("C/OS/saved/settings.txt")
  for i=1, #lines do
    local t = string.split(lines[i]," ")
    if t[1] == "TSKBR" then
      local taskbar = ram.get(4).value
      local v = parse_lxe(t[2])
      v.icon = create_image(v.location .. v.icon)
      table.insert(taskbar, v)
      ram.store(4, taskbar)
      ram.store(ram_loc, t[2], "string")
    end
  end
end

function os.initialize()
  --Store state in ram spot 3
  ram.store(3, "desktop", "string")
  ram.store(4, {}, "table")
  ram.store(5, create_image("C/OS/assets/menu_button.png"), "image")
  ram.store(6, create_image("C/Userdata/Pictures/default_background.png"), "image")

  --Load settings from HDD if the file exists
  if filesystem.file_exists("C/OS/saved/settings.txt") then
    loadSettings()
  else
    filesystem.create_file("C/OS/saved/settings.txt")
    local file = filesystem.open("C/OS/saved/settings.txt","w")
    file:write("TSKBR C/Programs/Notepad/notepad.lxe\n")
    file:write("TSKBR C/Programs/Browser/browser.lxe\n")
    file:close()
    loadSettings()
  end
end

function os.input(key)
  if key == "f1" then
    if ram.get(3) and ram.get(3).value ~= "help" then
      ram.store(3, "help", "string")
    else
      ram.store(3, "desktop", "string")
    end
  end
end

function os.update(dt)
  color(1,1,1,1)
  -- rect("fill",0,0,192,128)
  image(ram.get(6).value, 0,0, 192,120)
  if ram.get(3) and ram.get(3).value == "help" then
    color(0.3,0.3,0.3,0.5)
    rect("fill", 5,5, 187,123)
    color(0,0,0)
    rect("line",5,5, 187,123)
  end
  color(0.5,0.5,0.5)
  rect("fill",0,120,192,128)
  color(1,1,1,1)
  local taskbar = ram.get(4).value
  image(ram.get(5).value, 0,120, 8,8)
  local dx = 8
  for i=1, #taskbar do
    local item = taskbar[i]
    image(item.icon, dx,121, 7,7)
    dx = dx + 8
  end
end

return os

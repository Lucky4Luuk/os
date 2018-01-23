local os = {}

--Store state in ram spot 3
function os.initialize()
  ram.store(3, "desktop", "string")
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
  color(0,0,0,1)
  rect("fill",0,0,192,128)
  if ram.get(3) and ram.get(3).value == "help" then
    color(0.3,0.3,0.3,0.5)
    rect("fill", 5,5, 187,123)
    color(0,0,0)
    rect("line",5,5, 187,123)
  end
end

return os

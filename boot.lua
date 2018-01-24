local lib = {}
local canvas = love.graphics.newCanvas(192, 128)
canvas:setFilter("nearest","nearest",1)

function lib.draw(frame)
  love.graphics.setCanvas(canvas)
  love.graphics.clear()
  local dy = 64
  love.graphics.setFont(fonts.header)
  colored_text("[red] Orbit",16,math.floor(dy),64)
  color(0.6,0.6,0.6)
  line(0, 14, 192, 14)
  color(1,1,1)
  dy = dy + 64 + 24
  if frame < 10000 then
    love.graphics.setFont(fonts.text)
    if frame < 5000 then
      text("Booting" .. string.rep(".", (math.floor(frame/500) % 3) + 1),16,math.floor(dy))
    else
      text("Booting...",16,math.floor(dy))
    end
    dy = dy + 48
    if frame > 5000 then
      text("Done!",16,math.floor(dy))
      dy = dy + 48
    end
  end
  if frame > 5000 and frame < 10000 then
    love.graphics.setFont(fonts.text)
    if frame < 7500 then
      text("Initializing OS" .. string.rep(".", (math.floor(frame/500) % 3) + 1),16,math.floor(dy))
    else
      text("Initializing OS...",16,math.floor(dy))
    end
    dy = dy + 48
    if frame > 7500 then
      text("Done!",16,math.floor(dy))
      dy = dy + 48
      colored_text("Welcome to [red]Orbit-OS [white]!",16,math.floor(dy),48)
      dy = dy + 48
    end
  end
  text("F2: BIOS",1200,1008)
  love.graphics.setFont(fonts.text)
  love.graphics.setCanvas()
  love.graphics.push()
  love.graphics.scale(love.graphics.getWidth()/192, love.graphics.getHeight()/128)
  color(1,1,1,1)
  love.graphics.draw(canvas)
  love.graphics.pop()
end

return lib

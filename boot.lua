local lib = {}
local canvas = love.graphics.newCanvas(192, 128)
canvas:setFilter("nearest","nearest",1)

function lib.draw(frame)
  love.graphics.setCanvas(canvas)
  love.graphics.clear()
  local dy = 0
  love.graphics.setFont(fonts.header)
  text("Fantasy-OS",2,math.floor(dy),fonts.text:getHeight())
  dy = dy + fonts.header:getHeight() + 5
  if frame < 10000 then
    love.graphics.setFont(fonts.text)
    text("Booting...",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
    text("Done!",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
  end
  if frame > 5000 and frame < 10000 then
    love.graphics.setFont(fonts.text)
    text("Initializing OS...",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
    text("Done!",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
    text("abcdefghijklmnopqrstuvwxyz",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
    text("0123456789",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
    text("!@#$%^&*()-_+=",2,math.floor(dy),fonts.text:getHeight())
    dy = dy + fonts.text:getHeight() + 5
  end
  love.graphics.setFont(fonts.text)
  love.graphics.setCanvas()
  love.graphics.push()
  love.graphics.scale(love.graphics.getWidth()/192, love.graphics.getHeight()/128)
  love.graphics.draw(canvas)
  love.graphics.pop()
end

return lib

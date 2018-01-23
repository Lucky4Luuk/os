local lib = {}
local canvas = love.graphics.newCanvas(192, 128)
canvas:setFilter("nearest","nearest",1)

function lib.draw(frame)
  love.graphics.setCanvas(canvas)
  love.graphics.clear()
  local dy = 0
  love.graphics.setFont(fonts.header)
  love.graphics.print("Fantasy-OS",2,dy)
  dy = dy + fonts.header:getHeight()
  if frame < 10000 then
    love.graphics.setFont(fonts.text)
    love.graphics.print("Booting...",2,dy)
    dy = dy + fonts.text:getHeight() + 1
    love.graphics.print("Done!",2,dy)
    dy = dy + fonts.text:getHeight() + 1
  end
  if frame < 5000 then
    love.graphics.setFont(fonts.text)
    love.graphics.print("Initializing OS...",2,dy)
    dy = dy + fonts.text:getHeight() + 1
    love.graphics.print("Done!",2,dy)
    dy = dy + fonts.text:getHeight() + 1
  end
  love.graphics.setFont(fonts.text)
  love.graphics.setCanvas()
  love.graphics.push()
  love.graphics.scale(love.graphics.getWidth()/192, love.graphics.getHeight()/128)
  love.graphics.draw(canvas)
  love.graphics.pop()
end

return lib
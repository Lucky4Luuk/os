local major, minor, revision, codename = love.getVersion()

function color(r,g,b,a)
  if minor >= 11 then
    love.graphics.setColor(r,g,b,a or 1)
  else
    love.graphics.setColor(r*255,g*255,b*255,(a or 1) * 255)
  end
end

function rect(mode, x1,y1, x2,y2)
  local w = x2 - x1
  local h = y2 - y1
  love.graphics.rectangle(mode, x1,y1, w,h)
end

function clear()
  love.graphics.clear()
end

function text(text, x, y, height)
  love.graphics.push()
  love.graphics.scale(8/64, 8/64)
  love.graphics.print(text, x, y)
  love.graphics.pop()
end

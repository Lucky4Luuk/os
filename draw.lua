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

function line(...)
  love.graphics.line(...)
end

function clear()
  love.graphics.clear()
end

function text(text, x, y)
  love.graphics.push()
  love.graphics.scale(8/64, 8/64)
  love.graphics.print(text, x, y)
  love.graphics.pop()
end

function image(img, x,y, w,h)
  local img_w = img:getWidth()
  local img_h = img:getHeight()
  love.graphics.push()
  love.graphics.scale(w/img_w, h/img_h)
  love.graphics.draw(img, x,y)
  love.graphics.pop()
end

function create_image(path)
  return love.graphics.newImage(path)
end

function colored_text(text, x, y, size)
  local t = string.split(text," ")
  local nx = x
  love.graphics.push()
  love.graphics.scale(8/64, 8/64)
  -- love.graphics.print(text, x, y)
  for i=1, #t do
    if string.starts(t[i],"[red]") then
      color(1,0,0,1)
      local txt = t[i]:sub(6,#t[i])
      love.graphics.print(txt, nx, y)
      nx = nx + size*#txt
    elseif string.starts(t[i],"[white]") then
      color(1,1,1,1)
      local txt = t[i]:sub(8,#t[i])
      love.graphics.print(txt, nx, y)
      nx = nx + size*#txt
    else
      love.graphics.print(t[i], nx, y)
      nx = nx + size*#t[i] + size
    end
  end
  color(1,1,1,1)
  love.graphics.pop()
end

local lib = {} --The current library
local stack = {} --The stack of commands to execute
local draw_stack = {} --The draw stack
local canvas = love.graphics.newCanvas(192,128)
canvas:setFilter("nearest","nearest",1)

local os = nil

function lib.load()
  if keydown("f2") then
    --Load BIOS
    bios = require(ram.get(1).value)
    bios.initialize()
  else
    --Load OS
    os = require(ram.get(2).value)
    os.initialize()
  end
end

local function run(cmd)
  local c = cmd.command
  if c == "print" then
    local str = tostring(unpack(cmd.arguments))
    print(str)
  elseif c == "input" then
    local key = tostring(unpack(cmd.arguments))
    --Let the os decide what to do
    os.input(key)
  end
end

function lib.update(dt)
  love.graphics.setCanvas(canvas)
  color(0,0,0)
  os.update(dt)
  if #stack > 0 then
    run(stack[1])
    table.remove(stack, 1)
  end
  love.graphics.setCanvas()
end

function lib.draw()
  color(1,1,1)
  love.graphics.push()
  love.graphics.scale(love.graphics.getWidth() / 192, love.graphics.getHeight() / 128)
  love.graphics.draw(canvas)
  love.graphics.pop()
  love.graphics.setCanvas(canvas)
  love.graphics.clear()
  love.graphics.setCanvas()
end

function lib.execute(cmd, args)
  table.insert(stack, {command=cmd, arguments=args})
end

return lib

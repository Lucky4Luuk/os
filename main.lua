ram = require "ram"
cpu = require "cpu"
filesystem = require "filesystem"
require "utils"
require "draw"
local boot = require "boot"

love.graphics.setDefaultFilter("nearest","nearest",1)

fonts = {header=love.graphics.newFont("5x5_square.ttf",128), text=love.graphics.newFont("5x5_square.ttf",64)}
local debug_font = love.graphics.newFont(16)
local frame = 0
local state = "boot"
local totalTime = 0
local cpuHZ = 1000 --1000hz
local timestep = 1 / cpuHZ

ram.store(1, "C/BIOS/bios", "string")
ram.store(2, "C/OS/os", "string")

function parse_lxe(path)
  local file = io.open(path, "r")
  local data = file:read()
  file:close()
  return loadstring("return "..data)()
end

function love.load()
  --cpu.load()
end

function keydown(key)
  return love.keyboard.isDown(key)
end

function love.update(dt)
  totalTime = totalTime + dt
  while totalTime > timestep do
    if state == "boot" then
      if frame < cpuHZ * 10 then
        frame = frame + 1
      else
        state = "os"
        frame = 0
        cpu.load()
      end
    elseif state == "os" then
      cpu.update(timestep)
    end
    totalTime = totalTime - timestep
  end
end

function love.keypressed(key, scancode, is_repeat)
  if state == "boot" then
    --F2 for BIOS
  elseif state == "os" then
    cpu.execute("input", {key})
  end
end

function love.draw()
  if state == "boot" then
    boot.draw(frame)
  elseif state == "os" then
    cpu.draw()
  end
  color(1,1,1,1)
  -- love.graphics.setFont(debug_font)
  -- love.graphics.print(love.timer.getFPS())
end

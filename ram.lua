local lib = {} --The library.

local ram = {} --A table representing the ram.

function lib.initialize()
  for i=1, 2048 do --2048kb, so 2mb. 1kb can store 1 variable.
    ram[i] = {type=nil, value=nil}
  end
end

function lib.store(location, value_, type_)
  if type(location) == "number" and location < 2049 and location > 0 then
    ram[location] = {type=type_, value=value_}
  end
end

function lib.get(location)
  if type(location) == "number" and location < 2049 and location > 0 then
    return ram[location]
  end
  return {value=nil, type=nil} --Failsafe. To be replaced with an actual error.
end

return lib

local lib = {}

function lib.file_exists(path)
  local f = io.open(path, "rb")
  if f then f:close() end
  return f ~= nil
end

function lib.open(path, mode)
  --Should throw an error if the file doesn't exist
  return io.open(path, mode)
end

function lib.read(file)
  return file:read()
end

function lib.write(file, data)
  file:write(data)
end

function lib.close(file)
  file:close()
end

function lib.create_file(path)
  io.open(path, "w")
end

function lib.lines_from(path)
  if not lib.file_exists(path) then return {} end
  lines = {}
  for line in io.lines(path) do
    lines[#lines + 1] = line
  end
  return lines
end

return lib

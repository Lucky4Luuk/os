function string.starts(String,Start)
  return string.sub(String,1,string.len(Start))==Start
end

function string.ends(String,End)
  return End=='' or string.sub(String,-string.len(End))==End
end

function string.split(String,sep)
 local sep, fields = sep or ":", {}
 local pattern = string.format("([^%s]+)", sep)
 String:gsub(pattern, function(c) fields[#fields+1] = c end)
 return fields
end

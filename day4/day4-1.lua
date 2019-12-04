local re = require("re")

local function hasDouble(num)
  local regex = re.compile("(.)\1")
  local match = regex:execute(tostring(num))
  print(match)
  return match ~= nil
end

for i = 1, 1000 do
  print(i, hasDouble(i))
end

-- https://stackoverflow.com/questions/829063/how-to-iterate-individual-characters-in-lua-string

--  local regex = re.compile("r(e*)gex?")
--  local match = regex:execute("reeeeegex")
--  print( match ) -- note that 'match' will be nil if there was no match. Also,
--	  --all blocks that match a variable number of characters such as "*" or "?"
--	  --automatically create a capture group as part of the matching algorithm.
--	  --Rather than throw than information away, it is saved in the resulting match
--	  --object.

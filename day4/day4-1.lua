
		-- if !((d1 == d2 && d2 != d3) || (d2 == d3 && d1 != d2 && d3 != d4) || (d3 == d4 && d2 != d3 && d4 != d5) || (d4 == d5 && d3 != d4 && d5 != d6) || (d5 == d6 && d5 != d4)) {

local function hasDouble(str)
  local n1 = str:sub(1, 1)
  local n2 = str:sub(2, 2)
  local n3 = str:sub(3, 3)
  local n4 = str:sub(4, 4)
  local n5 = str:sub(5, 5)
  local n6 = str:sub(6, 6)

  return n1 == n2 or n2==n3 or n3==n4 or n4==n5 or n5==n6
end

local function noDescending(str)
  local n1 = str:sub(1, 1)
  local n2 = str:sub(2, 2)
  local n3 = str:sub(3, 3)
  local n4 = str:sub(4, 4)
  local n5 = str:sub(5, 5)
  local n6 = str:sub(6, 6)

  return n1<=n2 and n2<=n3 and n3<=n4 and n4<=n5 and n5<=n6
end

local function meetsCriteria(str)
  return hasDouble(str) and noDescending(str)
end

local count = 0
for i = 367479, 893698 do
  local str = tostring(i)
  if meetsCriteria(str) then
    count = count + 1
  end
end
print('Total Count: ' .. count)

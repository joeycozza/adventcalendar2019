local function hasDouble(n1, n2, n3, n4, n5, n6)
  return n1 == n2 or n2 == n3 or n3 == n4 or n4 == n5 or n5 == n6
end

local function noDescending(n1, n2, n3, n4, n5, n6)
  return n1 <= n2 and n2 <= n3 and n3 <= n4 and n4 <= n5 and n5 <= n6
end

local function noTriples(n1, n2, n3, n4, n5, n6)
  return (n1 == n2 and n2 ~= n3) or
          (n2 == n3 and n1 ~= n2 and n3 ~= n4) or
          (n3 == n4 and n2 ~= n3 and n4 ~= n5) or
          (n4 == n5 and n3 ~= n4 and n5 ~= n6) or
          (n5 == n6 and n5 ~= n4)
end

local function meetsCriteria(i)
  local str = tostring(i)
  local n1 = str:sub(1, 1)
  local n2 = str:sub(2, 2)
  local n3 = str:sub(3, 3)
  local n4 = str:sub(4, 4)
  local n5 = str:sub(5, 5)
  local n6 = str:sub(6, 6)

  return hasDouble(n1, n2, n3, n4, n5, n6) and
          noDescending(n1, n2, n3, n4, n5, n6) and
          noTriples(n1, n2, n3, n4, n5, n6)
end

local count = 0
for i = 367479, 893698 do
  if meetsCriteria(i) then
    count = count + 1
  end
end
print('Total Count: ' .. count)

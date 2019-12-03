local module = {}

function module.createTape() 
  local tape = {}

  for line in io.lines('input.txt') do
    for num in line:gmatch("%d+") do
      table.insert(tape, num)
    end
  end

  return tape
end

function module.executeStep(tape, curIndex) 
  local instruction = tape[curIndex + 1]
  local val1 = tape[tape[curIndex + 2] + 1]
  local val2 = tape[tape[curIndex + 3] + 1]
  local targetLocation = tape[curIndex + 4]

  if instruction == '1' then
    tape[targetLocation + 1] = val1 + val2
  elseif instruction == '2' then
    tape[targetLocation + 1] = val1 * val2
  else 
    return 
  end

  module.executeStep(tape, curIndex + 4)
end

function module.log(tape)
  local str = ''
  for index, value in ipairs(tape) do
    str = str .. value .. ','
  end
  print(str)
  print('\n')
end

return module

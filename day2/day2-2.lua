local helpers = require('helpers')

local function compute(noun, verb)
  local tape = helpers.createTape()
  tape[2] = noun
  tape[3] = verb
  helpers.executeStep(tape, 0)
  return tape[1]
end


local goal = 19690720

for noun = 0, 99 do
  for verb = 0, 99 do
    local output = compute(noun, verb)
    if output == goal then
      print('Noun: ' .. noun)
      print('Verb: ' .. verb)
    end
  end
end

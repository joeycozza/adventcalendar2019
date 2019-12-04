local helpers = require('helpers')

local function compute(verb, noun)
  local tape = helpers.createTape()
  tape[2] = verb
  tape[3] = noun
  helpers.executeStep(tape, 0)
  return tape[1]
end

local output = compute(12, 2)
print(output)

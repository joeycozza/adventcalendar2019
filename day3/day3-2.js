const _ = require('lodash')
const fs = require('fs')

const directions = { R: [1, 0], L: [-1, 0], U: [0, 1], D: [0, -1] }
const findLowest = (hits, wire1, wire2) => _.minBy(hits, hit => wire1[hit] + wire2[hit])
const parseMoveInfo = move => [_.head(move), _.toNumber(_.tail(move).join(''))]

function createWire(movements) {
  const wire = {}
  let [x, y, totalSteps] = [0, 0, 0]

  movements.forEach(move => {
    const [direction, steps] = parseMoveInfo(move)
    const [dx, dy] = directions[direction]

    for (let i = 0; i < steps; i++) {
      x += dx
      y += dy
      const key = `${x}-${y}`

      totalSteps++
      wire[key] = wire[key] || totalSteps
    }
  })
  return wire
}

const [movements1, movements2] = fs
  .readFileSync('input.txt', 'utf-8')
  .split('\n')
  .map(str => str.split(','))

const wire1 = createWire(movements1)
const wire2 = createWire(movements2)

const hits = _.intersection(_.keys(wire1), _.keys(wire2))

const lowest = findLowest(hits, wire1, wire2)
console.log('wire1[lowest] + wire2[lowest]: ', wire1[lowest] + wire2[lowest])

const _ = require('lodash')
const fs = require('fs')

const directions = { R: [1, 0], L: [-1, 0], U: [0, 1], D: [0, -1] }
const sumPostion = pos => _.sumBy(pos.split('-'), _.toNumber)
const findClosest = hits => _.minBy(hits, sumPostion)
const parseMoveInfo = move => [_.head(move), _.toNumber(_.tail(move).join(''))]

function createWire(movements) {
  const wire = []
  let [x, y] = [0, 0]

  movements.forEach(move => {
    const [direction, steps] = parseMoveInfo(move)
    const [dx, dy] = directions[direction]

    for (let i = 0; i < steps; i++) {
      x += dx
      y += dy
      wire.push(`${x}-${y}`)
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

const hits = _.intersection(wire1, wire2)

const closestHit = findClosest(hits)
console.log('sumPostion(closestHit): ', sumPostion(closestHit))

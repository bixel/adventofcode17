let input = getInput("277678")

let inputNumber = Int(input)!

var grid: [Int: [Int: Int]] = [0: [0: 1]]

func calculateSum(_ grid: [Int: [Int: Int]], _ currentX: Int, _ currentY: Int) -> Int {
  var sum = 0
  for x in currentX - 1 ... currentX + 1 {
    for y in currentY - 1 ... currentY + 1 {
      if !(x == currentX && y == currentY) {
        // print("Scanning surrounding at (\(x), \(y))")
        if let neighbourColumn = grid[x] {
          if let neighbourSum = neighbourColumn[y] {
            // print("Found value \(neighbourSum) at \(x), \(y)")
            sum += neighbourSum
          }
        }
      }
    }
  }
  return sum
}

func move(_ grid: [Int: [Int: Int]],
          _ position: inout Vector2D,
          _ direction: inout Vector2D) {
  position += direction
  // print("Will move to new position \(position)")
  let testPosition = position + direction--
  // print("Testing if space at position \(testPosition) is empty")
  if grid[testPosition.x] == nil || grid[testPosition.x]![testPosition.y] == nil {
    direction = direction--
  }
}

var position = Vector2D(0, 0)
var direction = Vector2D(1, 0)
var currentSum = grid[0]![0]!
while (grid[position.x]![position.y]!) < inputNumber {
  move(grid, &position, &direction)
  if grid[position.x] == nil {
    grid[position.x] = [:]
  }
  currentSum = calculateSum(grid, position.x, position.y)
  grid[position.x]![position.y] = currentSum
}

print(currentSum)

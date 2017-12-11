let input = getInput("""
  2	8	8	5	4	2	3	1	5	5	1	2	15	13	5	14
  """)

var memorySettings: [[Int]] = [input.split(separator: "\t").map { Int($0)! }]

func checkDoubleOccurance(_ memorySetting: [Int], _ inHistory: [[Int]]) -> Bool {
  let rval = inHistory.reduce(0, { $1 == memorySetting ? $0 + 1 : $0 })
  return rval > 1
}

func redistribute(_ memorySetting: [Int]) -> [Int] {
  var newSetting = memorySetting
  var blockStack = newSetting.max()!
  var idx = memorySetting.index(of: blockStack)!
  newSetting[idx] = 0
  while blockStack > 0 {
    idx += 1
    if idx >= newSetting.count {
      idx = 0
    }
    newSetting[idx] += 1
    blockStack -= 1
  }
  return newSetting
}

var counter = 0
while !checkDoubleOccurance(memorySettings.last!, memorySettings) {
  memorySettings.append(redistribute(memorySettings.last!))
  counter += 1
}

print(counter)

print(memorySettings.count - 1 - memorySettings.index(where: { $0 == memorySettings.last! })!)

public func getInput(value: String) -> String {
  if CommandLine.arguments.count == 2 {
    return CommandLine.arguments[1]
  } else {
    return value
  }
}

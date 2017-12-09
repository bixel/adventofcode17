public func getInput(_ value: String) -> String {
  if CommandLine.arguments.count == 2 {
    return CommandLine.arguments[1]
  } else {
    return value
  }
}

struct Vector2D {
  var x = 0, y = 0
  init(_ x: Int, _ y: Int){
    self.x = x
    self.y = y
  }
}

extension Vector2D {
  static func + (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(left.x + right.x, left.y + right.y)
  }
  static func - (left: Vector2D, right: Vector2D) -> Vector2D {
    return Vector2D(left.x - right.x, left.y - right.y)
  }
  static prefix func - (vector: Vector2D) -> Vector2D {
    return Vector2D(-vector.x, -vector.y)
  }
  static func += (left: inout Vector2D, right: Vector2D) {
    left = left + right
  }
  static func -= (left: inout Vector2D, right: Vector2D) {
    left += -right
  }
  static postfix func -- (vector: Vector2D) -> Vector2D {
    return Vector2D(-vector.y, vector.x)
  }
  static postfix func ++ (vector: Vector2D) -> Vector2D {
    return Vector2D(vector.y, -vector.x)
  }
}


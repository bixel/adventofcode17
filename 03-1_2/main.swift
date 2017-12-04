let input = getInput("277678")

let inputNumber = Int(input)!

class GridEdge {
  let value: Int
  let corner: Int  // position of edge
  let distance: Int  // distance to previous edge, aka. width of square
  let previousEdge: GridEdge?
  var nextEdge: GridEdge?

  init(_ previousEdge: GridEdge? = nil){
    self.previousEdge = previousEdge
    if self.previousEdge != nil {
      if self.previousEdge!.corner == 3 {
        // if the previous edge is in the lower right corner, we have to move
        // outside
        self.corner = 0
        self.distance = self.previousEdge!.distance + 2
      } else {
        // just move through the edges, the distances stays the same
        self.corner = self.previousEdge!.corner + 1
        self.distance = self.previousEdge!.distance
      }
      self.value = self.previousEdge!.value + self.distance
      self.previousEdge!.nextEdge = self
    } else {
      // Do some initialization for the center "Edge"
      self.corner = 3
      self.distance = 0
      self.value = 1
    }
  }
}

func fillEdges(_ maxNumber: Int) -> [GridEdge] {
  var edgeList: [GridEdge] = [GridEdge()]
  while edgeList.last!.value <= maxNumber {
    edgeList.append(GridEdge(edgeList.last!))
  }
  return edgeList
}

// first fill a list of edges
let edges = fillEdges(inputNumber)

// the correct starting point lies in between the last two edges

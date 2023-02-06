import UIKit

func projectionArea(_ grid: [[Int]]) -> Int {

    var result = 0
    let longest = grid.reduce(into: 0) { partialResult, array in
        partialResult = max(partialResult, array.count)
    }
    var projectionsY = Array(repeating: 0, count: longest)
    var projectionsX = [Int]()

    grid.forEach { axis in
        let maxX = axis.reduce(into: 0) { partialResult, val in
            partialResult = max(partialResult, val)
        }
        projectionsX.append(maxX)
        for index in axis.indices {
            if axis[index] != 0 {
                result += 1
            }
            projectionsY[index] = max(projectionsY[index], axis[index])
        }
    }

    let yFields = projectionsY.reduce(into: 0) { partialResult, val in
        partialResult += val
    }

    let xFields = projectionsX.reduce(into: 0) { partialResult, val in
        partialResult += val
    }

    result += yFields + xFields

    return result
}


projectionArea([[1,2],[3,4]])
projectionArea([[2]])
projectionArea([[1,0],[0,2]])

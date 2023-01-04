import UIKit

func matrixReshape(_ mat: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {

    let originalMatrix = mat.flatMap({ return $0 })

    if originalMatrix.count != (r * c) { return mat }

    var rowIndex = 0
    var resultMatrix = [[Int]]()

    for value in originalMatrix {
        if resultMatrix.isEmpty {
            resultMatrix.append([Int]())
        }

            resultMatrix[rowIndex].append(value)
        if resultMatrix[rowIndex].count == c && resultMatrix.count < r {
            resultMatrix.append([Int]())
            rowIndex += 1
        }
    }

    print(resultMatrix)

    return resultMatrix
}

matrixReshape([[1,2],[3,4]], 1, 4)
matrixReshape([[1,2],[3,4]], 1, 7)
matrixReshape([[1,2],[3,4], [5, 6]], 2, 3)


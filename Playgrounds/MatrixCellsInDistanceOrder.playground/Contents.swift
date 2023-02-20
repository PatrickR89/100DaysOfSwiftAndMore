import UIKit

func allCellsDistOrder(_ rows: Int, _ cols: Int, _ rCenter: Int, _ cCenter: Int) -> [[Int]] {

    var matrix = [[Int]]()
    var matrixDict = [Int: [[Int]]]()

    for rowIndex in 0..<rows {
        for colIndex in 0..<cols {
            let cellDist = [abs(rowIndex - rCenter), abs(colIndex - cCenter)]

            matrixDict[(cellDist[0] + cellDist[1]), default: []].append([rowIndex, colIndex])

        }
    }

    print(matrixDict.sorted(by: {$0.key < $1.key}))

    for key in matrixDict.sorted(by: {$0.key < $1.key}) {
        matrix += key.value
    }
    return matrix
}

allCellsDistOrder(1, 2, 0, 0)
allCellsDistOrder(3, 3, 0, 2)

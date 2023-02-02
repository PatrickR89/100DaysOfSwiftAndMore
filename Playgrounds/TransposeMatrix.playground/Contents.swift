import UIKit

func transpose(_ matrix: [[Int]]) -> [[Int]] {

    var transpoded = Array(repeating: Array(repeating: 0, count: matrix.count), count: matrix[0].count)

    for i in 0..<matrix.count {
        for j in 0..<matrix[0].count {
            transpoded[j][i] = matrix[i][j]
        }
    }
    print(transpoded)
    return transpoded
    }

transpose([[1,2,3],[4,5,6],[7,8,9]])

import UIKit

func isToeplitzMatrix(_ matrix: [[Int]]) -> Bool {

    var result = true
    var row = 0

    while result && row < matrix.count {

        for col in 0..<matrix[row].count {
            if col - 1 >= 0 && row - 1 >= 0 && matrix[row][col] != matrix[row - 1][col - 1] {
                result = false
            }
        }

        row += 1
    }

    return result
}

isToeplitzMatrix([[1,2,3,4],[5,1,2,3],[9,5,1,2]])
isToeplitzMatrix([[1,2],[2,2]])
isToeplitzMatrix([[18],[66]])
isToeplitzMatrix([[11,74,0,93],[40,11,74,7]])
isToeplitzMatrix([[1,2,3,4],[5,2,1,3]])

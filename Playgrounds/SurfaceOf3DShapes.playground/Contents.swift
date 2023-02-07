import UIKit

func surfaceArea(_ grid: [[Int]]) -> Int {

    var result = 0
    var length = grid.count

    for index in 0..<length {
        for secondIndex in 0..<length {

            if grid[index][secondIndex] > 0 { result += grid[index][secondIndex] * 4 + 2}
            if index > 0 { result -= min(grid[index][secondIndex], grid[index - 1][secondIndex]) * 2 }
            if secondIndex > 0 { result -= min(grid[index][secondIndex], grid[index][secondIndex - 1]) * 2}
        }
    }

    return result
}


surfaceArea([[1,2],[3,4]])

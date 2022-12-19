import UIKit

func islandPerimeter(_ grid: [[Int]]) -> Int {

    var perimiterCounter = 0

    for row in 0..<grid.count {
        for col in 0..<grid[row].count {
            if grid[row][col] == 1 {
                if col == 0 {
                    perimiterCounter += 1
                    if col + 1 < grid[row].count && grid[row][col + 1] == 0 {
                        perimiterCounter += 1
                    } else if col == grid[row].count - 1 {
                        perimiterCounter += 1
                    }
                } else if col > 0 && col < grid[row].count - 1 {

                    if grid[row][col - 1] == 0 {
                        perimiterCounter += 1
                    }

                    if grid[row][col + 1] == 0 {
                        perimiterCounter += 1
                    }
                } else if col == grid[row].count - 1 {
                    perimiterCounter += 1

                    if grid[row][col - 1] == 0 {
                        perimiterCounter += 1
                    }
                }

                if (row + 1 < grid.count) && (grid[row + 1][col] == 0) {
                    perimiterCounter += 1
                } else if row == grid.count - 1{
                    perimiterCounter += 1
                }

                if (row - 1 >= 0) && (grid[row - 1][col] == 0) {
                    perimiterCounter += 1
                } else if row == 0 {
                    perimiterCounter += 1
                }
            }
        }
    }

    return perimiterCounter
}

islandPerimeter([[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]])
islandPerimeter([[1, 0]])
islandPerimeter([[1]])

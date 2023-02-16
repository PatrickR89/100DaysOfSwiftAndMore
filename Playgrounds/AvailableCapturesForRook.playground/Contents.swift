import UIKit

enum Direction {
    case backward
    case forward
}

func numRookCaptures(_ board: [[Character]]) -> Int {

    var rookPosition = [0, 0]
    var horizontal = [Character]()
    var vertical = [Character]()
    var result = 0

    for rowIndex in board.indices {
        for colIndex in board[rowIndex].indices {
            if board[rowIndex][colIndex] == "R" {
                rookPosition = [rowIndex, colIndex]
            }
        }
    }

    horizontal = board[rookPosition[0]]

    for index in board.indices {
        vertical.append(board[index][rookPosition[1]])
    }

    moveRook(horizontal, .backward, rookPosition[1], &result)
    moveRook(horizontal, .forward, rookPosition[1], &result)
    moveRook(vertical, .backward, rookPosition[0], &result)
    moveRook(vertical, .forward, rookPosition[0], &result)

    return result
}

func moveRook(_ axis: [Character], _ direction: Direction, _ start: Int, _ result: inout Int) {

    switch direction {
    case .backward:
        var index = start - 1
        while index >= 0 {
            if axis[index] == "B" {
                return
            } else if axis[index] == "p" {
                result += 1
                return
            }
            else if axis[index] == "." {
                index -= 1
            } else {
                print("error")
                return
            }
        }

    case .forward:
        var index = start + 1
        while index < axis.count {
            if axis[index] == "B" {
                return
            } else if axis[index] == "p" {
                result += 1
                return
            } else if axis[index] == "." {
                index += 1
            } else {
                print("error")
                return
            }
        }
    }
}

//numRookCaptures([[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","R",".",".",".","p"],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]])
//numRookCaptures([[".",".",".",".",".",".",".","."],[".","p","p","p","p","p",".","."],[".","p","p","B","p","p",".","."],[".","p","B","R","B","p",".","."],[".","p","p","B","p","p",".","."],[".","p","p","p","p","p",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."]])
//numRookCaptures([[".",".",".",".",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".","p",".",".",".","."],["p","p",".","R",".","p","B","."],[".",".",".",".",".",".",".","."],[".",".",".","B",".",".",".","."],[".",".",".","p",".",".",".","."],[".",".",".",".",".",".",".","."]])
numRookCaptures([[".",".",".",".",".",".","p","."],["p",".",".",".",".",".","R","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".",".","."],[".",".",".",".",".",".","p","."]])

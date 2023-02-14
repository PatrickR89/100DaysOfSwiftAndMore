import UIKit

func isValidSudoku(_ board: [[Character]]) -> Bool {

    var isValid = true
    var indexRow = 0
    var segmentBorders = [0, 3, 6]

    while indexRow < 9 {
        var indexCol = 0
        let rowArray = convertArray(board[indexRow])

        var tempCol = [Character]()
        while indexCol < 9 {
            tempCol.append(board[indexCol][indexRow])
            indexCol += 1
        }

        let colArray = convertArray(tempCol)

        isValid = isValid && validateSegment(rowArray) && validateSegment(colArray)

        if !isValid {
            return false
        }

        indexRow += 1
    }

    var segment = [[Int]: [Int]]()

    for rowSegment in segmentBorders {
        for row in 0...2 {
            for colSegment in segmentBorders {
                var tempSegment = [Character]()
                for col in 0...2 {
                    tempSegment.append(board[row + rowSegment][col + colSegment])
                }
//                print(row + rowSegment ,tempSegment, rowSegment,colSegment)
                segment[[rowSegment, colSegment], default: []] += convertArray(tempSegment)
            }
        }
    }

    for values in segment.values {
        isValid = isValid && validateSegment(values)
//        print(values)
    }

    return isValid
}

func convertArray(_ input: [Character]) -> [Int]{
    var input = input.filter { $0 != "." }.map { Int(String($0))! }

    return input
}

func validateSegment(_ input: [Int]) -> Bool {

    return input.count == Set(input).count
}

isValidSudoku([["5","3",".",".","7",".",".",".","."]
               ,["6",".",".","1","9","5",".",".","."]
               ,[".","9","8",".",".",".",".","6","."]
               ,["8",".",".",".","6",".",".",".","3"]
               ,["4",".",".","8",".","3",".",".","1"]
               ,["7",".",".",".","2",".",".",".","6"]
               ,[".","6",".",".",".",".","2","8","."]
               ,[".",".",".","4","1","9",".",".","5"]
               ,[".",".",".",".","8",".",".","7","9"]])

isValidSudoku([["8","3",".",".","7",".",".",".","."]
               ,["6",".",".","1","9","5",".",".","."]
               ,[".","9","8",".",".",".",".","6","."]
               ,["8",".",".",".","6",".",".",".","3"]
               ,["4",".",".","8",".","3",".",".","1"]
               ,["7",".",".",".","2",".",".",".","6"]
               ,[".","6",".",".",".",".","2","8","."]
               ,[".",".",".","4","1","9",".",".","5"]
               ,[".",".",".",".","8",".",".","7","9"]])

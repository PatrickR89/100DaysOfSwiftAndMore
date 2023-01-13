import UIKit

func convert(_ s: String, _ numRows: Int) -> String {

    guard s.count > 1 && numRows > 1 else {return s}
    var matrix = [[Character]](repeating: [], count: numRows)
    var index = 0
    var isDecreasing = false

    for character in s {
        matrix[index].append(character)
        index += isDecreasing ? -1 : 1

        if index == -1 || index == numRows {
            index += isDecreasing ? 2 : -2
            isDecreasing.toggle()
        }
    }

    return matrix.map { return String($0)}.joined()
}

convert("PAYPALISHIRING", 4)

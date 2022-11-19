import UIKit

func getRow(_ rowIndex: Int) -> [Int] {

// based on previous Pascal's triangle algorithm

//    var pascal: [[Int]] = [[Int]]()
//
//    for index in 0...rowIndex {
//        pascal.append([])
//        if pascal[index].isEmpty {
//            pascal[index].append(1)
//            if index > 0 {
//                pascal[index].append(1)
//            }
//        }
//        if index > 0 {
//            for numIndex in 1..<index {
//                let num = pascal[index - 1][numIndex - 1] + pascal[index - 1][numIndex]
//                pascal[index].insert(num, at: numIndex)
//            }
//        }
//    }
//
//    return pascal[rowIndex]

// saving only one array

    var row: [Int] = [1]

    if rowIndex == 0 {
        return row
    }

    if row.count == 1 {
        row.append(1)
    }

    for index in 1...rowIndex {
        var newRow = [1, 1]
        if index > 1 {
            for (indexNum, num) in row.enumerated() {
                if indexNum > 0 {
                    let newNum = row[indexNum - 1] + num
                    newRow.insert(newNum, at: indexNum)
                }
            }
            row = newRow
        }
    }

    return row
}

getRow(0)
getRow(1)
getRow(2)
getRow(3)
getRow(4)
getRow(5)
getRow(10)
getRow(33)


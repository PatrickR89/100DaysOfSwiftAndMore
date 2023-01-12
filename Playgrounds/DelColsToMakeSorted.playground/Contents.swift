import UIKit

func minDeletionSize(_ strs: [String]) -> Int {

    let input = strs.map {
        return Array($0)
    }

    var deleteCounter = 0
    var deletedCols = [Int: Int]()

    for row in 1..<strs.count {
        for col in 0..<strs[0].count {
            if input[row][col] < input[row - 1][col] {
                deletedCols[col, default: 0] += 1
                print(input[row][col])
            }
        }
    }

    deletedCols.forEach {
        if $0.value > 0 {
            deleteCounter += 1
        }
    }

    print(deletedCols)

    return deleteCounter
}

minDeletionSize(["cba","daf","ghi"])
minDeletionSize(["a","b"])
minDeletionSize(["zyx","wvu","tsr"])
minDeletionSize(["cekjd","ihpzr","zvzzx"])
minDeletionSize(["rrjk","furt","guzm"])

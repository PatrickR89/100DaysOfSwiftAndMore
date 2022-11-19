import UIKit

func generate(_ numRows: Int) -> [[Int]] {

    var pascal: [[Int]] = [[Int]]()
    for index in 0..<numRows {
        pascal.append([])
        if pascal[index].isEmpty {
            pascal[index].append(1)
            if index > 0 {
                pascal[index].append(1)
            }
        }
        if index > 0 {
            for numIndex in 1..<index {
                let num = pascal[index - 1][numIndex - 1] + pascal[index - 1][numIndex]
                pascal[index].insert(num, at: numIndex)
            }
        }
    }

    return pascal
    }

generate(5)
generate(2)
generate(10)
generate(1)
generate(0)

import UIKit

func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {

    var m = m
    var n = n

    for pos in 0..<ops.count {
        let x = ops[pos][0]
        let y = ops[pos][1]

        m = min(x, m)
        n = min(y, n)
    }

    return m*n
}
// func maxCount(_ m: Int, _ n: Int, _ ops: [[Int]]) -> Int {
//    if ops.count == 0 {
//        return m * n
//    }
//
//    var matrix = [[Int]]()
//    var maxCounter = 0
//
//    for row in 0..<m {
//        matrix.append([Int]())
//        for _ in 0..<n {
//            matrix[row].append(0)
//        }
//    }
//
//    performIncrement(&matrix, ops, 0)
//
//    matrix.forEach {
//        $0.forEach {
//            if $0 == matrix[0][0] {
//                maxCounter += 1
//            }
//        }
//    }
//
//    print(matrix)
//
//    return maxCounter
//}

//func performIncrement(_ matrix: inout [[Int]], _ ops: [[Int]], _ index: Int) {
//    for x in 0..<ops[index][0] {
//        for y in 0..<ops[index][1] {
//            matrix[x][y] += 1
//        }
//    }
//    if index + 1 < ops.count {
//        performIncrement(&matrix, ops, index + 1)
//    }
//}

maxCount(3, 3, [[2,2],[3,3]])
maxCount(3, 3, [[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3]])
maxCount(3, 3, [])

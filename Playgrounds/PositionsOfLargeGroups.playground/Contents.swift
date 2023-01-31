import UIKit

func largeGroupPositions(_ s: String) -> [[Int]] {

    let s = Array(s).map { String($0) }
    var currChar = ""
    var positions = [[Int]]()
    var currPositions = [Int]()

    for index in s.indices {



        if s[index] != currChar {
            if currChar != "" {positions.append(currPositions) }
            currChar = s[index]
            currPositions = [index, index]
        }

        if currChar == s[index] {
            currPositions[1] = index
        }

        if index == s.count - 1 {
            positions.append(currPositions)
        }
    }

    positions = positions.filter { $0[1] - $0[0] >= 2 }

    return positions
}

//largeGroupPositions("abbxxxxzzy")
//largeGroupPositions("abc")
//largeGroupPositions("abcdddeeeeaabbbcd")
largeGroupPositions("aaa")

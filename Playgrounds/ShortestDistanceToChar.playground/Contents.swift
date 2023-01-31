import UIKit

func shortestToChar(_ s: String, _ c: Character) -> [Int] {

    let word = Array(s)
    var result = [Int]()

    var prevC = word.firstIndex(of: c)!
    var nextC = word.firstIndex(of: c)!

    for (index, char) in word.enumerated() {
        if char == c {
            result.append(0)
            prevC = index
            if index + 1 < word.count {
                nextC = word[index + 1..<word.count].firstIndex(of: c) ?? nextC
            }
        } else {
            result.append(min(abs(nextC - index), abs(index - prevC)))

        }
    }


    return result
}

shortestToChar("loveleetcode", "e")
shortestToChar("aaab", "b")
// [3,2,1,0,1,0,0,1,2,2,1,0]

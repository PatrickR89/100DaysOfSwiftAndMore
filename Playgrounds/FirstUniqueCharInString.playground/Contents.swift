import UIKit

func firstUniqChar(_ s: String) -> Int {

    var uniqueLetters = [Character]()
    var repeating = [Character]()
    let value = Array(s)

    value.forEach {
        if uniqueLetters.contains($0) {
            repeating.append($0)
        } else {
            uniqueLetters.append($0)
        }
    }

    print(uniqueLetters, repeating)

    for char in uniqueLetters {
        if !repeating.contains(char) {
            return value.firstIndex(of: char)!
        }
    }

    return -1
}

firstUniqChar("leetcode")
firstUniqChar("loveleetcode")
firstUniqChar("aabb")

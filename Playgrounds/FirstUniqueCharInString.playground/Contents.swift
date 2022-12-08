import UIKit

struct SingleChar {
    var value: Character
    var index: Int
    var repeating: Bool
}

func firstUniqChar(_ s: String) -> Int {

    var uniqueLetters = [SingleChar]()
    let value = Array(s)

    for (index, char) in value.enumerated() {
        if let index = uniqueLetters.firstIndex(where: {$0.value == char}) {
            uniqueLetters[index].repeating = true
        } else {
            uniqueLetters.append(SingleChar(value: char, index: index, repeating: false))
        }
    }

    if let index = uniqueLetters.firstIndex(where: {$0.repeating == false }) {
        return uniqueLetters[index].index
    }

    return -1

 }

firstUniqChar("leetcode")
firstUniqChar("loveleetcode")
firstUniqChar("aabb")

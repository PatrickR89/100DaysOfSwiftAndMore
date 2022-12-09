import UIKit

func findTheDifference(_ s: String, _ t: String) -> Character {

    if s.count == 0 { return Character(t)}

    var lettersInT = Array(t)

    s.forEach {
        if let index = lettersInT.firstIndex(of: $0) {
            lettersInT.remove(at: index)
        }
    }

    return lettersInT[0]
}

findTheDifference("abcd", "abcde")
findTheDifference("", "e")

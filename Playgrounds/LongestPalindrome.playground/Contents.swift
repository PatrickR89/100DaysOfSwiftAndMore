import UIKit

func longestPalindrome(_ s: String) -> Int {
    var charCounter = [Character:Int]()
    var result: Int = 0

    s.forEach {
        if charCounter[$0] == nil {
            charCounter[$0] = 1
        } else {
            charCounter[$0]! += 1
        }
    }

    charCounter = charCounter.mapValues {
        if $0 % 2 == 0 {
            result += $0
            return 0
        } else if $0 % 2 == 1 && $0 > 1 {
            result += ($0 - 1)
            return 1
        }
        return 1
    }

    if charCounter.contains(where: { $0.value == 1}) {
        result += 1
    }

    return result
}

longestPalindrome("abccccdd")
longestPalindrome("a")
longestPalindrome("aA")
longestPalindrome("aaaaaaaaabbbbbbcccccAAAAAIIIIDDDLLLoooopppppp")

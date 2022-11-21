import UIKit

func isPalindrome(_ s: String) -> Bool {
    var sentence = Array(s.lowercased())
    let filter = "abcdefghijklmnopqrstuvwxyz0123456789"
    sentence.removeAll(where: { char in
        !filter.contains(char)
    })

    if sentence.count == 0 || sentence.count == 1 {
        return true
    }
    let half = (sentence.count - 1) / 2
    let firstHalf = Array(sentence[0...half])
    let secondHalf = Array(sentence[half+1...sentence.count - 1].reversed())

    for (index, char) in secondHalf.enumerated() {
        if char == firstHalf[index] {
            continue
        } else {
            return false
        }
    }

    return true
}

isPalindrome(",,,,,,,,,,,,acva")
isPalindrome("A man, a plan, a canal: Panama")
isPalindrome(" ")
isPalindrome("race a car")
isPalindrome("Anne, I vote more cars race Rome to Vienna.")
isPalindrome("Doc, note I dissent: a fast never prevents a fatness. I diet on cod.")

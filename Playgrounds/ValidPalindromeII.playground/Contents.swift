import UIKit

func validPalindrome(_ s: String) -> Bool {

    let s = Array(s)



    return checkSubsequence(s)
}

func checkSubsequence(_ s: [Character]) -> Bool {
    if s.count == 1 {
        return true
    }

    if s == s.reversed() {
        return true
    }

    var left = 0
    var right = s.count - 1
    var charDeleted = false
    while left <= right {
        if s[left] == s[right] {
            left += 1
            right -= 1
        } else if Array(s[left + 1...right]) == Array(s[left + 1...right].reversed()){
            if charDeleted {
                return false
            }

            charDeleted = true
            left += 1
        } else if Array(s[left...right - 1]) == Array(s[left...right - 1].reversed()) {
            if charDeleted {
                return false
            }

            charDeleted = true
            right -= 1
        } else {
            return false
        }
    }

    return true
}

validPalindrome("aba")
validPalindrome("abca")
validPalindrome("abc")
validPalindrome("acucucubucucucua")
validPalindrome("tebbem")
validPalindrome("ebcbbececabbacecbbcbe")
validPalindrome("aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga")
validPalindrome("ababbab")

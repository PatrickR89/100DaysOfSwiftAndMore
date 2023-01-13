import UIKit

func validPalindrome(_ s: String) -> Bool {

    let s = Array(s)
    var left = 0
    var right = s.count - 1

    while left < right {
        if s[left] == s[right] {
            left += 1
            right -= 1
        } else {
            if checkSubsequence(Array(s[left...right - 1])) {
                return true
            }

            return checkSubsequence(Array(s[left + 1...right]))
        }
    }

    return true
}

func checkSubsequence(_ s: [Character]) -> Bool {

    var left = 0
    var right = s.count - 1

    while left < right {
        if s[left] == s[right] {
            left += 1
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

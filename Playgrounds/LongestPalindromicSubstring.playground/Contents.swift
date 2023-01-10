import UIKit

func longestPalindrome(_ s: String) -> String {

    if s.count < 2 {
        return s
    }

    let s: [String] = Array(s).map { return String($0)}
    var result = ""

    for index in s.indices {
        isPalindrome(s, index, index, &result)
        isPalindrome(s, index, index + 1, &result)

        if result.count > (s.count - index) * 2 {
            break
        }
    }


    return result
}

func isPalindrome(_ s: [String], _ left: Int, _ right: Int, _ result: inout String) {
    var left = left
    var right = right
    while ( left >= 0 && right < s.count && s[left] == s[right]) {
        left -= 1
        right += 1
    }

    if result.count < right - left - 1 {
        result = Array(s[left + 1..<right]).joined()
    }
}

longestPalindrome("babad")
longestPalindrome("cbbd")
longestPalindrome("a")
longestPalindrome("ac")

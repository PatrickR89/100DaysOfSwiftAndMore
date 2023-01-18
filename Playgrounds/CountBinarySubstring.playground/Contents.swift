import UIKit

func countBinarySubstrings(_ s: String) -> Int {

    let s = Array(s)
    var current = 1
    var previous = 0
    var result = 0

    for index in 1..<s.count {
        if s[index] == s[index-1] {
            current += 1
        } else {
            result += min(current, previous)
            previous = current
            current = 1
        }

    }

    result += min(current, previous)

    return result
}

countBinarySubstrings("00110011")

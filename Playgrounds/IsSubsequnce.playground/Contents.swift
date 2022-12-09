import UIKit

func isSubsequence(_ s: String, _ t: String) -> Bool {

    if s.count != 0 && t.count == 0 {
        return false
    }

    if s.count == 0 && t.count != 0 {
        return true
    }
    let s = Array(s)
    let t = Array(t)
    var i = 0
    var subChars = 0

    while i < t.count && subChars < s.count {
        if s[subChars] == t[i] {
            subChars += 1
        }

        i += 1
    }


    return subChars == s.count
}

isSubsequence("abc", "ahbgdc")
isSubsequence("axc", "ahbgdc")
isSubsequence("acb", "ahbgdc")
isSubsequence("aaaaaa", "bbaaaa")
isSubsequence("ab", "baab")

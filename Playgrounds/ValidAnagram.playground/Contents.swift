import UIKit

func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count == 0 || t.count == 0 || t.count != s.count {
        return false
    }

    let tArray = Array(t).sorted()
    let sArray = Array(s).sorted()

    for (index, char) in sArray.enumerated() {
        if char != tArray[index] {return false}
    }

    return true
}

isAnagram("anagram", "nagaram")
isAnagram("rat", "car")
isAnagram("ab", "a")
isAnagram("aaaaaabbbbbb", "aabb")

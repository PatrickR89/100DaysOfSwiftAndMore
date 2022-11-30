import UIKit

func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count == 0 || t.count == 0 || t.count != s.count {
        return false
    }

    var tempArray = [String]()

    for (index, char) in s.enumerated() {
        
    }

    return true
}

isAnagram("anagram", "nagaram")
isAnagram("rat", "car")
isAnagram("ab", "a")
isAnagram("aaaaaabbbbbb", "aabb")

import UIKit

func isAnagram(_ s: String, _ t: String) -> Bool {

    if s.count == 0 || t.count == 0 {
        return false
    }

    var tempArray = Array(t)

    for char in s {
        guard let index = tempArray.firstIndex(of: char) else {
            return false
        }
        tempArray.remove(at: index)
    }

    return tempArray.isEmpty
}

isAnagram("anagram", "nagaram")
isAnagram("rat", "car")
isAnagram("ab", "a")
isAnagram("aaaaaabbbbbb", "aabb")

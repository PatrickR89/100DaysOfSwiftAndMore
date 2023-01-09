import UIKit

func lengthOfLongestSubstring(_ s: String) -> Int {

    let s = Array(s)
    var frame = [Character: Int]()
    var startIndex = 0
    var lastIndex = 0
    var result = 0

    while lastIndex < s.count {
        let endChar = s[lastIndex]
        frame[endChar, default: 0] += 1

        while (frame[endChar])! > 1 {
            let startChar = s[startIndex]
            frame[startChar, default: 0] -= 1
            startIndex += 1
        }
        result = max(result, lastIndex - startIndex + 1)
        lastIndex += 1

    }

    return result
}

//lengthOfLongestSubstring("abcabcbb")
//lengthOfLongestSubstring("bbbbbbb")
//lengthOfLongestSubstring("pwwkew")
lengthOfLongestSubstring("sDGFJHLbsdhabd b kjbfsdf jkwebjfwkj 73y474")
lengthOfLongestSubstring("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~ ")

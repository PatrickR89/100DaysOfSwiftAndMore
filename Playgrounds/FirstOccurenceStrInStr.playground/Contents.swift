import UIKit

func strStr(_ haystack: String, _ needle: String) -> Int {

    let haystack = Array(haystack).map { String($0) }
    let needle = Array(needle).map { String($0) }
    var needleIndex = 0

    if needle.count > haystack.count { return -1 }

    while needleIndex < haystack.count {
        var isNeedle = true
        var tempIndex = 0

        if haystack[needleIndex] == needle[tempIndex] {
            while tempIndex < needle.count {
                if needleIndex + tempIndex < haystack.count {
                    isNeedle = isNeedle && haystack[needleIndex + tempIndex] == needle[tempIndex]
                } else {
                    isNeedle = false
                }
                tempIndex += 1
            }

            if isNeedle {
                return needleIndex
            }
        }

        needleIndex += 1
    }

    return -1
}

strStr("sadbutsad", "sad")
strStr("leetcode", "leeto")
strStr("mississippi", "issip")
strStr("mississippi", "issipi")

import UIKit

func partition(_ s: String) -> [[String]] {

    let s = Array(s)
    var result = [[String]]()
    var currentPartitions = [String]()

    palindromePartition(0, &currentPartitions, &result, s)

    return result
}

func isPalindrome(_ s: [Character], _ startIndex: Int, _ endIndex: Int) -> Bool {

    var startIndex = startIndex
    var endIndex = endIndex

    while startIndex <= endIndex {
        if s[startIndex] != s[endIndex] {
            return false
        }

        startIndex += 1
        endIndex -= 1
    }

    return true
}

func palindromePartition(_ index: Int, _ currentPartitions: inout [String], _ result: inout [[String]], _ s: [Character]) {
    if index == s.count {
        result.append(currentPartitions)
        return
    }

    var secondIndex = index

    while secondIndex < s.count {
        if isPalindrome(s, index, secondIndex) {
            let tempString = s[index...secondIndex].map { String($0)}.joined()
            currentPartitions.append(tempString)
            palindromePartition(secondIndex + 1, &currentPartitions, &result, s)
            currentPartitions.removeLast()
        }

        secondIndex += 1
    }
}

partition("aab")
partition("a")
partition("abccba")

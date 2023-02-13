import UIKit

func isAlienSorted(_ words: [String], _ order: String) -> Bool {

    let order = Array(order).map {String($0)}

    let words = words.map { string in
        Array(string).map { String($0) }
    }

    for index in 1..<words.count {
        var shorter = words[index].count < words[index - 1].count ? words[index] : words[index - 1]
        var isLatterShorter = words[index].count < words[index - 1].count ? true : false
        var charIndex = 0
        while charIndex < shorter.count {

            let firstComparable = words[index][charIndex]
            let secondComparable = words[index - 1][charIndex]

            if order.firstIndex(of: firstComparable)! < order.firstIndex(of: secondComparable)! {
                return false
            } else if order.firstIndex(of: firstComparable)! > order.firstIndex(of: secondComparable)! {
                break
            }
            
            if charIndex == shorter.count - 1 && isLatterShorter {
                return false
            }

            charIndex += 1
        }
    }

    return true
}

isAlienSorted(["hello","leetcode"], "hlabcdefgijkmnopqrstuvwxyz")
isAlienSorted(["word","world","row"], "worldabcefghijkmnpqstuvxyz")
isAlienSorted(["apple","app"], "abcdefghijklmnopqrstuvwxyz")

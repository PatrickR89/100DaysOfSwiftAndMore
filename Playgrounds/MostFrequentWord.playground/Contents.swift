import UIKit

func mostCommonWord(_ paragraph: String, _ banned: [String]) -> String {

    var words = [""]

    for character in paragraph {
        let charSet = [".",",",":",";","!", "'", "?", " "]
        let character = String(character)
        let lastWordIndex = words.count - 1
        if !charSet.contains(character) {
            words[lastWordIndex] += character
        } else if charSet.contains(character) && words[lastWordIndex].count != 0 {
            words.append("")
        }
    }

    words = words.map { $0.lowercased() }.filter { $0 != ""}

    var wordCounter = [String: Int]()
    var result: (String, Int) = ("", 0)

    for word in words {
        if !banned.contains(word) {
            wordCounter[word, default: 0] += 1
        }
    }

    for word in wordCounter.keys {
        if wordCounter[word, default: 0] > result.1 {
            result = (word, wordCounter[word, default: 0])
        }
    }

    return result.0
}

mostCommonWord("Bob hit a ball, the hit BALL flew far after it was hit.", ["hit"])
mostCommonWord("a.", [])
mostCommonWord("a, a, a, a, b,b,b,c, c", ["a"])

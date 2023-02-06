import UIKit

func uncommonFromSentences(_ s1: String, _ s2: String) -> [String] {

    let s1 = s1.components(separatedBy: " ")
    let s2 = s2.components(separatedBy: " ")
    var wordCounter = [String: Int]()

    s1.forEach { word in
        wordCounter[word, default: 0] += 1
    }

    s2.forEach { word in
        wordCounter[word, default: 0] += 1
    }

    wordCounter = wordCounter.filter({ element in
        element.value < 2
    })

    return Array(wordCounter.keys)
}

uncommonFromSentences("this apple is sweet", "this apple is sour")
uncommonFromSentences("apple apple", "banana")

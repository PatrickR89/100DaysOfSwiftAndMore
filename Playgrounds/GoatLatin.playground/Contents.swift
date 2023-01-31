import UIKit

func toGoatLatin(_ sentence: String) -> String {

    let sentence = Array(sentence.split(separator: " "))
    var result = [String]()
    let vowels: [Character] = ["a", "A", "e", "E", "i", "I", "o", "O", "u", "U"]

    for (index, word) in sentence.enumerated() {
        var newWord = word
        if !vowels.contains(word.first!) {
            newWord += String(newWord.removeFirst())
        }
        newWord += "ma"
        for _ in 0...index {
            newWord += "a"
        }

        result.append(String(newWord))
    }

    return result.joined(separator: " ")
}

toGoatLatin("I speak Goat Latin")
toGoatLatin("The quick brown fox jumped over the lazy dog")

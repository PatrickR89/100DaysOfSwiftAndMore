import UIKit

func shortestCompletingWord(_ licensePlate: String, _ words: [String]) -> String {

    var chars = [String]()

    for char in licensePlate {
        if Int(String(char)) == nil && char != " " {
            chars.append(String(char))
        }
    }

    chars = chars.map { $0.lowercased() }

    var compatibleWords = [String]()

    for word in words {
        var tempWord = Array(word).map { String($0) }
        var tempChars = [String]()

        for char in chars {
            if let wIndex = tempWord.firstIndex(of: char) {
                tempWord.remove(at: wIndex)
                tempChars.append(char)
            }
        }

        if tempChars.count == chars.count {
            compatibleWords.append(word)
        }
    }

    var result = ""

    if compatibleWords.count == 1 {
        result = compatibleWords[0]
    } else {
        result = compatibleWords.reduce(into: compatibleWords[0], { partialResult, word in
            if word.count < partialResult.count {
                partialResult = word
            }
        })
    }

    return result
}

shortestCompletingWord("1s3 PSt", ["step","steps","stripe","stepple"])
shortestCompletingWord("1s3 456", ["looks","pest","stew","show"])
shortestCompletingWord("iLMOl80", ["send","why","want","program","million","wonder","manager","success","likely","them"])

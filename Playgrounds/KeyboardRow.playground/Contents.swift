import UIKit

func findWords(_ words: [String]) -> [String] {
    let firstRow = Set("qwertyuiop")
    let secondRow = Set("asdfghjkl")
    let thirdRow = Set("zxcvbnm")

    var response = [String]()

    for word in words {
        let tempWord = Set(word.lowercased())
        if tempWord.isSubset(of: firstRow) || tempWord.isSubset(of: secondRow) || tempWord.isSubset(of: thirdRow) {
            response.append(String(word))
        }
    }

    return response
    }


findWords(["Hello","Alaska","Dad","Peace"])
findWords(["omk"])
findWords(["adsdf","sfd"])

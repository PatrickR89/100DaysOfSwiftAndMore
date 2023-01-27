import UIKit

func uniqueMorseRepresentations(_ words: [String]) -> Int {

    let morseValues = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
    let letters: [Character] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]

    var morseCodeString = [String]()


    for word in words {
        var currentString = ""
        word.forEach { char in
            if let index = letters.firstIndex(of: char) {
                currentString += morseValues[index]
            }
        }

        morseCodeString.append(currentString)
    }

    return Set(morseCodeString).count
    }

uniqueMorseRepresentations(["gin","zen","gig","msg"])
uniqueMorseRepresentations(["a"])

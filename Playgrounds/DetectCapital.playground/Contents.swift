import UIKit

enum Case {
    case capital
    case lower
}

func detectCapitalUse(_ word: String) -> Bool {

    let capitals: [Character] = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var resultCases = [Case]()

    for letter in word {
        if capitals.contains(letter) {
            guard !resultCases.contains(.lower) else {return false}
            resultCases.append(Case.capital)
        } else {
            if resultCases.count > 1 && !resultCases.contains(.lower) { return false }
            resultCases.append(Case.lower)
        }
    }

    return true
    }

detectCapitalUse("USA")
detectCapitalUse("leetcode")
detectCapitalUse("gooGle")
detectCapitalUse("FlaG")

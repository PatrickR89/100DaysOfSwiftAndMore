import UIKit

func reverseVowels(_ s: String) -> String {
    var charArray: [Character] = Array(s)
    var firstInd = 0
    var lastInd = charArray.count - 1

    for _ in 0...(charArray.count / 2) {
        if firstInd < lastInd {
        if let tempFirst = charArray[firstInd...lastInd].firstIndex(where: {checkVowel(char: $0) == true}),
           let tempLast = charArray[firstInd...lastInd].lastIndex(where: {checkVowel(char: $0) == true}) {
            let tempChar = charArray[tempFirst]
            charArray[tempFirst] = charArray[tempLast]
            charArray[tempLast] = tempChar

            firstInd = tempFirst + 1
            lastInd = tempLast - 1
        }
        }
    }
    return String(charArray)
}

func checkVowel(char: Character) -> Bool {
    return char == "a" || char == "A" || char == "e" || char == "E" || char == "i" || char == "I" || char == "o" || char == "O" || char == "u" || char == "U"
}

reverseVowels("hello")
reverseVowels("leetcode")
reverseVowels("a.")

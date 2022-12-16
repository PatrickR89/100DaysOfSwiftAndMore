import UIKit

func repeatedSubstringPattern(_ s: String) -> Bool {

    var input = Array(s)

    for index in 1..<input.count {
        if input[0] == input[index] && input.count % index == 0 {
            print(input[index], index, "of", input.count )
            print(checkSubstring(input, index))
            if checkSubstring(input, index) { return true }
        }
    }
    return false
}

func checkSubstring(_ input: [Character], _ position: Int) -> Bool {
    for i in 0..<input.count - position {
        if input[i] != input[i + position] {return false}
    }

    return true
}

repeatedSubstringPattern("abcabcabcabc")
repeatedSubstringPattern("aba")
repeatedSubstringPattern("abab")


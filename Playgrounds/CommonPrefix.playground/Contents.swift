import UIKit

func longestCommonPrefix(_ strs: [String]) -> String {
    let charArray = strs.map { string in
        return Array(string)
    }
    var commonChars = [Character]()
    var prefix = ""
    for (index, char) in charArray[0].enumerated() {
        var approvalArray = [Bool]()
        charArray.forEach { stringArray in
            if !stringArray.contains(char) {
                approvalArray.append(false)
                return
            }

            if index <= stringArray.count - 1 && stringArray[index] == char {
                approvalArray.append(true)
            } else {
                approvalArray.append(false)
            }
        }

        if !approvalArray.contains(false) {
            commonChars.append(char)
        } else {
            break
        }
    }

    if commonChars.count > 0 {
        prefix = String(commonChars)
    }

    return prefix
}

longestCommonPrefix(["flower","flow","flight"])
longestCommonPrefix(["dog","racecar","car"])
longestCommonPrefix(["cir","car"])
longestCommonPrefix(["aa","aa"])
longestCommonPrefix(["aa","a"])


import UIKit

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 || strs.count == 1 {return ""}
    for (index, char) in strs[0].enumerated() {
        for (strIndex, word) in strs[1 ... strs.count - 1].enumerated() {
            if let secondIndex = word.firstIndex(of: char) {
                print(secondIndex)
//                if secondIndex == index {
//                    print("has it")
//                } else {
//                    print("doesnt have")
//                }
            }
        }
    }
    return ""
   }

longestCommonPrefix(["flower","flow","flight"])
longestCommonPrefix(["dog","racecar","car"])

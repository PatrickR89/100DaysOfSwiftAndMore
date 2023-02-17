import UIKit

func removeOuterParentheses(_ s: String) -> String {

    var arrS = Array(s)
    var depth = 0
    var result = ""

    for bracket in s {
        if bracket == "(" {
            depth += 1
        }

        if depth > 1 {
            result += String(bracket)
        }

        if bracket == ")" {
            depth -= 1
        }
    }

    return result
}

removeOuterParentheses("(()())(())")
removeOuterParentheses("(()())(())(()(()))")
removeOuterParentheses("()()")

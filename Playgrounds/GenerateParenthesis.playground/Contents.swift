import UIKit

func generateParenthesis(_ n: Int) -> [String] {

    var result = [String]()

    if n == 0 {
        return result
    }

    addParenthesis(n, 0, "", &result)

    return result
}

func addParenthesis(_ left: Int, _ right: Int, _ par: String, _ result: inout [String]) {
    if left == 0 && right == 0 {
        result.append(par)
        return
    }

    if left > 0 { addParenthesis(left - 1, right + 1, par + "(", &result)}
    if right > 0 { addParenthesis(left, right - 1, par + ")", &result)}
}

generateParenthesis(3)

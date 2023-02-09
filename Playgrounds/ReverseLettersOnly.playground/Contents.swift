import UIKit

func reverseOnlyLetters(_ s: String) -> String {

    let pattern = "[a-zA-Z]"
    var result = Array(repeating: "", count: s.count)
    let s = Array(s).map { String($0) }
    var letters = [String]()
    var counter = s.count

    for index in s.indices {
        if s[index].range(of: pattern, options: .regularExpression) == nil {
            result[index] = s[index]
        } else {
            letters.insert(s[index], at: 0)
        }
    }

    while counter >= 0 {
        if let index = result.firstIndex(of: "") {
            result[index] = letters.removeFirst()
        }
        counter -= 1
    }

    return result.joined()
}

reverseOnlyLetters("a-bC-dEf-ghIj")
//"j-Ih-gfE-dCba"

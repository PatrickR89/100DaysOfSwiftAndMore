import UIKit

func intToRoman(_ num: Int) -> String {
    var numbers = String(num).compactMap { Int(String($0)) }
    numbers.reverse()
    let symbols = [["X", "V", "I"], ["C", "L", "X"], ["M", "D", "C"], ["", "", "M"]]
    var roman = [String]()
    for (index, num) in numbers.enumerated() {
        if num < 4 {
            roman += [Array(repeating: symbols[index][2], count: num).joined()]
        } else if num == 4 {
            roman += [symbols[index][2] + symbols[index][1]]
        } else if num == 5 {
            roman += [symbols[index][1]]
        } else if num > 5 && num < 9 {
            roman += [symbols[index][1] + Array(repeating: symbols[index][2], count: num - 5).joined()]
        } else if num == 9 {
            roman += [symbols[index][2] + symbols[index][0]]
        }
    }
    roman.reverse()
    let result = roman.joined()
    return result
}

intToRoman(1994)
intToRoman(1682)

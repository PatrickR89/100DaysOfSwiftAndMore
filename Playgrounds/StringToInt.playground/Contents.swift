import UIKit

func myAtoi(_ s: String) -> Int {

    var prefix = 1
    var wasPrefix = false
    var numbers = [String]()

    for character in s {
        if !numbers.isEmpty && numbers[0] == "0" {
            numbers.removeFirst()
        }
        if character == "-" {
            if wasPrefix {
                break
            }
            prefix = -1
            wasPrefix = true
        } else if character == "+" {
            if wasPrefix {
                break
            }
            wasPrefix = true
            continue
        } else if character == " "{
            if wasPrefix {
                break
            }
            continue
        } else if Int(String(character)) != nil {
            if numbers.count <= 11 {
            numbers.append(String(character))
            }
            wasPrefix = true
        } else {
            break
        }
    }

    print(numbers)

    let resultNum = prefix * ( Int(String(numbers.joined())) ?? 0 )

    if resultNum > Int32.max {
        return Int(Int32.max)
    }

    if resultNum < Int32.min {
        return Int(Int32.min)
    }

    return resultNum
}

//myAtoi("42")
//myAtoi("4193 with words")
//myAtoi("   -42")
//myAtoi("words and 987")
myAtoi("20000000000000000000")
myAtoi("  0000000000012345678")

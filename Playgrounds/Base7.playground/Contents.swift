import UIKit

func convertToBase7(_ num: Int) -> String {

    guard num != 0 else {
        return "0"
    }


    var result = [String]()
    var tempNum = abs(num)

    while tempNum > 0 {
        result.append("\(tempNum % 7)")
        tempNum /= 7
    }

    if num < 0 {
        result.append("-")
    }


    print(result)

    return result.reversed().joined(separator: "")
}

convertToBase7(-8)

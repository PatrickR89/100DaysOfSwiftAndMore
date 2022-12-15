import UIKit

func addStrings(_ num1: String, _ num2: String) -> String {

    let firstNum = num1.count >= num2.count ? convertToArray(num1) : convertToArray(num2)
    let secondNum = num2.count > num1.count ? convertToArray(num1) : convertToArray(num2)
    var result = [Int]()
    var rest = 0


    for (index, num) in firstNum.enumerated() {
        var tempSecond = 0
        if index < secondNum.count {
            tempSecond = secondNum[index]
        }

        var resultNum = num + tempSecond + rest
        if resultNum > 9 {
            resultNum = resultNum - 10
            rest = 1
        } else {
            rest = 0
        }

        result.append(resultNum)
    }

    if rest == 1 {
        result.append(rest)
    }

    let strResult = result.reversed().map {
        return String($0)
    }

    return strResult.joined(separator: "")
}

func convertToArray(_ num: String) -> [Int] {
    let arr = Array(num)
    let array = arr.reversed().map {
        return Int(String($0))!
    }
    return array
}

addStrings("11", "123")
addStrings("456", "77")
addStrings("0", "0")
addStrings("1", "9")

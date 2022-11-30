import UIKit

func addDigits(_ num: Int) -> Int {

    var digits = turnNumtoDigits(num)
    var tempSum = 0

    while digits.count > 1 {
        tempSum = 0
        digits.forEach {
            tempSum += $0
        }

        digits = turnNumtoDigits(tempSum)
    }


    return digits[0]
    }

func turnNumtoDigits(_ num: Int) -> [Int] {
    let tempArray = Array(String(num))
    let newArray = tempArray.map {
        return Int(String($0))!
    }

    return newArray
}

addDigits(38)
addDigits(0)
addDigits(1)

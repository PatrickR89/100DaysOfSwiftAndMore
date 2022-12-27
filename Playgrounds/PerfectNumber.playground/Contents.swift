import UIKit

func checkPerfectNumber(_ num: Int) -> Bool {

    guard num > 5 else {
        return false
    }

    let limit = Int(sqrt(Double(num)))
    var tempNums = [Int]()

    for i in 2...limit {
        if num % i == 0 {
            tempNums.append(i)
        }
    }

    return num == tempNums.reduce(into: 1) { sum, value in
        sum += value

        if (num / value) != value {
            sum += (num / value)
        }
    }
}

checkPerfectNumber(28)
checkPerfectNumber(7)
checkPerfectNumber(0)

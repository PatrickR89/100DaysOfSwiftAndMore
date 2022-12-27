import UIKit

func checkPerfectNumber(_ num: Int) -> Bool {

    guard num > 5 else {
        return false
    }

    let limit = Int(floor(sqrt(Double(num))))
    var sum = 1

    for i in 2...limit {
        if num % i == 0 {
            sum += i + num / i
        }

        if sum > num {return false}
    }


    return num == sum
}

checkPerfectNumber(28)
checkPerfectNumber(7)
checkPerfectNumber(0)

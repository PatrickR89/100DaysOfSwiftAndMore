import UIKit

func checkPerfectNumber(_ num: Int) -> Bool {

    if num <= 0 {
        return false
    }

    var tempNums = [Int]()

    for i in 1..<num {
        if num % i == 0 {
            tempNums.append(i)
        }
    }

    var tempRes = tempNums.reduce( 0 ) {
        return $0 + $1
    }

    print(tempNums)
    print(tempRes)


    return num == tempRes
}

checkPerfectNumber(28)
checkPerfectNumber(7)
checkPerfectNumber(0)

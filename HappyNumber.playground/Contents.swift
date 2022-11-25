import UIKit
import Foundation

func isHappy(_ n: Int) -> Bool {
    var historySet = [Int]()
    var n = n

    while true {
        n = squareSum(n: n)

        if n == 1 {
            return true
        }

        if historySet.contains(n) {
            return false
        }

        historySet.append(n)
    }
}

func squareSum(n: Int) -> Int {
    var squareSum = 0
    var n = n

    while n != 0 {
        print(n)
        squareSum += (n % 10) * (n % 10)
        n /= 10
    }

    return squareSum
}

isHappy( 19)
isHappy( 2)
isHappy( 7)
isHappy( 33)

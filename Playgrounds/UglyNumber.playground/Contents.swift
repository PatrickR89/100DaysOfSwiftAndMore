import UIKit

func isUgly(_ n: Int) -> Bool {

    if n <= 0 {
        return false
    }

    var num = n

    while num % 5 == 0 || num % 3 == 0 || num % 2 == 0 {
        if num % 5 == 0 {
            num /= 5
        }

        if num % 3 == 0 {
            num /= 3
        }

        if num % 2 == 0 {
            num /= 2
        }
    }

    if num == 1 {
        return true
    } else {
        return false
    }
}

isUgly(6)
isUgly(1)
isUgly(14)
isUgly(876)
isUgly(45)
isUgly(144)

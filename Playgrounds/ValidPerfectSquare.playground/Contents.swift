import UIKit

func isPerfectSquare(_ num: Int) -> Bool {

    var numR = 1

    while ( numR * numR ) <= num {
        if (numR * numR) == num { return true }
        if ((numR + 1) * (numR + 1)) > num {return false}
        numR += 1
    }

    return false
}

isPerfectSquare(16)
isPerfectSquare(14)
isPerfectSquare(100)
isPerfectSquare(44)
isPerfectSquare(144)
isPerfectSquare(200)

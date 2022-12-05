import UIKit

func isPowerOfThree(_ n: Int) -> Bool {

    if n == 1 {return true}
    if n < 3 {return false}

    let memLimit = NSDecimalNumber(decimal: pow(2, 31) - 1).doubleValue
    let maxPotential = Double(floor(log(memLimit) / log(3)))
    let maxPowOfThree = Int(pow(3, maxPotential))

    return (maxPowOfThree % n == 0)
    }

isPowerOfThree(3)
isPowerOfThree(27)
isPowerOfThree(30)
isPowerOfThree(3 * 3 * 3)
isPowerOfThree(92)
isPowerOfThree(1093 * 3)

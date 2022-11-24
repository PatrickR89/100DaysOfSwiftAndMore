import UIKit

func titleToNumber(_ columnTitle: String) -> Int {
    let letters = ["A", "B", "C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S", "T","U","V","W","X","Y","Z"]

    let columnTitle = Array(columnTitle).reversed()
    var sum = 0

    for (index, letter) in columnTitle.enumerated() {
        let firstIndex = letters.firstIndex(of: String(letter))!
        let exp = Int(NSDecimalNumber(decimal: pow(26, index)))

        sum += exp * (firstIndex + 1)
        print("for letter: \(letter) exponent: \(exp) add to sum: \(exp * (firstIndex + 1))")
    }
    return sum
}

titleToNumber("A")
titleToNumber("B")
titleToNumber("C")
titleToNumber("Z")
titleToNumber("AB")
titleToNumber("ZY")
titleToNumber("YYZ")

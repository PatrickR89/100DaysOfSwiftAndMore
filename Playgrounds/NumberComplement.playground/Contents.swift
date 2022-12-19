import UIKit

func findComplement(_ num: Int) -> Int {

    var binaryRep = [Int32]()
    var num = Int32(num)

    while num > 0 {
        binaryRep.append(num % 2)
        num /= 2
    }

    let newBinary = Array((binaryRep.map {
        $0 == 0 ? "1" : "0"
    }).reversed()).joined(separator: "")

    return Int(newBinary, radix: 2)!
}

findComplement(5)
findComplement(1)
findComplement(3543)

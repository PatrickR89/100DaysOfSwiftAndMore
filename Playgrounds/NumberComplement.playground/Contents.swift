import UIKit

func findComplement(_ num: Int) -> Int {

    var binaryRep = [Int32]()
    var num = Int32(num)
    let cutOff = num.bitWidth - num.leadingZeroBitCount - 1

    for _ in 0...cutOff {
        let bit = num & 1
        binaryRep.append(bit)
        num = num >> 1
    }

    let newBinary = Array((binaryRep.map {
        $0 == 0 ? "1" : "0"
    }).reversed()).joined(separator: "")

    return Int(newBinary, radix: 2)!
}

findComplement(5)
findComplement(1)
findComplement(3543)

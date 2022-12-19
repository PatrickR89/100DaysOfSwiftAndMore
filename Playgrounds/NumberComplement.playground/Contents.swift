import UIKit

func findComplement(_ num: Int) -> Int {

    var binaryRep = [Int32]()
    var num = Int32(num)

    for _ in 1...32 {
        let bit = num & 1
        binaryRep.append(bit)
        num = num >> 1
    }

    if let index = binaryRep.lastIndex(where: {$0 == 1}) {
        binaryRep = Array(binaryRep[0...index])
    }

    let newBinary = Array((binaryRep.map {
        $0 == 0 ? "1" : "0"
    }).reversed()).joined(separator: "")

    return Int(newBinary, radix: 2)!
}

findComplement(5)
findComplement(1)
findComplement(3543)

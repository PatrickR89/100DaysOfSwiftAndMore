import UIKit

func bitwiseComplement(_ n: Int) -> Int {
    var binaryRep = [Int32]()
    var num = Int32(n)

    if n == 0 {
        return 1
    }

    for _ in 0...31 {
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

bitwiseComplement(5)
bitwiseComplement(0)
bitwiseComplement(1000000000)

import UIKit

func hammingWeight(_ n: String) -> Int {

    var input = Int(n, radix: 2)!
    var bitCount = n.count // 32
    var result = 0

    while bitCount > 0 {
        result += input & 1
        input = input >> 1
        bitCount -= 1
    }

    return result
}

let first: String = "00000010100101000001111010011100"
let second: String = "11111111111111111111111111111101"
let third: String = "00000000000000000000000000001011"
let fourth: String = "00000000000000000000000010000000"

hammingWeight(first)
hammingWeight(second)
hammingWeight(third)
hammingWeight(fourth)

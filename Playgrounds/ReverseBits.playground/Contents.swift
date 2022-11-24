import UIKit

// with conversion to String due to Int Literal Overflow

func reverseBits(_ n: String) -> Int {

    var input = Int(n, radix: 2)!
    var bitCount = n.count // 32
    var result = 0

    while bitCount > 0 {
        result *= 2
        result += input & 1
        input = input >> 1
        bitCount -= 1
    }

    return result
}

let first: String = "00000010100101000001111010011100"
let second: String = "11111111111111111111111111111101"

reverseBits(first)
reverseBits(second)

// 43261596 00000010100101000001111010011100 964176192 (00111001011110000010100101000000)
// 3221225471

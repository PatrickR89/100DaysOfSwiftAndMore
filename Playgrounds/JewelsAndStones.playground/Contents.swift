import UIKit

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {

    let jewels = Array(jewels)
    let stones = Array(stones)
    var result = 0

    for jewelIndex in 0..<jewels.count {
        for stoneIndex in 0..<stones.count {

            result += jewels[jewelIndex] == stones[stoneIndex] ? 1 : 0
        }
    }

    return result
}

numJewelsInStones("aA", "aAAbbbb")
numJewelsInStones("z", "ZZ")

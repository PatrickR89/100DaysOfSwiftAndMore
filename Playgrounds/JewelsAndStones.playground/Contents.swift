import UIKit

func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {

    let jewels = Array(jewels)
    let stones = Array(stones)
    var result = 0

    for jewel in jewels {
        for stone in stones {
            if stone == jewel {
                result += 1
            }
        }
    }

    return result
}

numJewelsInStones("aA", "aAAbbbb")
numJewelsInStones("z", "ZZ")

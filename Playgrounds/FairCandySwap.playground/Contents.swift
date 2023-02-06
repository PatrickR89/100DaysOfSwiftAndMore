import UIKit

func fairCandySwap(_ aliceSizes: [Int], _ bobSizes: [Int]) -> [Int] {

    let aliceCount = aliceSizes.reduce(into: 0) { partialResult, box in
        partialResult += box
    }

    let bobCount = bobSizes.reduce(into: 0) { partialResult, box in
        partialResult += box
    }

    let diff = bobSizes.count - aliceSizes.count
    var bobIndex = 0
    var aliceIndex = 0

    if diff < 0 {
        aliceIndex = aliceSizes.count - 1

        while aliceIndex >= 0 {
            bobIndex = 0
            while bobIndex < bobSizes.count {
                if aliceCount - aliceSizes[aliceIndex] + bobSizes[bobIndex] == bobCount - bobSizes[bobIndex] + aliceSizes[aliceIndex] {
                    return [aliceSizes[aliceIndex], bobSizes[bobIndex]]
                }

                bobIndex += 1
            }

            aliceIndex -= 1
        }

    } else  {
        bobIndex = bobSizes.count - 1

        while bobIndex >= 0 {
            aliceIndex = 0
            while aliceIndex < aliceSizes.count {
                if bobCount - bobSizes[bobIndex] + aliceSizes[aliceIndex] == aliceCount - aliceSizes[aliceIndex] + bobSizes[bobIndex] {
                    return [aliceSizes[aliceIndex], bobSizes[bobIndex]]
                }

                aliceIndex += 1
            }

            bobIndex -= 1
        }

    }




    return []
}


fairCandySwap([1,1], [2,2])
fairCandySwap([2], [1, 3])
fairCandySwap([32,38,8,1,9], [68,92])

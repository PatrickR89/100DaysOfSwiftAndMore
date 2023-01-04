import UIKit

func distributeCandies(_ candyType: [Int]) -> Int {

    let max = candyType.count / 2
    let byType = Set(candyType).count

    return byType < max ? byType : max
}

distributeCandies([1,1,2,2,3,3])
distributeCandies([1,1,2,3])
distributeCandies([6,6,6,6])

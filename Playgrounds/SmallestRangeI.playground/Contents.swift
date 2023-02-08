import UIKit

func smallestRangeI(_ nums: [Int], _ k: Int) -> Int {

    let max = nums.max()!
    let min = nums.min()!

    if max - min - 2*k <= 0 {return 0}
    return max - min - 2*k
}

smallestRangeI([1,3,6], 3)
smallestRangeI([1], 0)
smallestRangeI([0,10], 2)

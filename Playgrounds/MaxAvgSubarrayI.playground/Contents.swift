import UIKit

func findMaxAverage(_ nums: [Int], _ k: Int) -> Double {

    var index = 0
    var result = Double(Int32.min)

    while (index + k - 1) < nums.count {
        let tempResult = nums[index..<(index + k)].reduce(into: 0) { $0 = $0 + $1 }
        print(nums[index..<(index + k)])
        result = max(result, Double(tempResult)/Double(k))
        index += 1
    }

    return result
}

findMaxAverage([1,12,-5,-6,50,3], 4)

import UIKit

func maxSubarraySumCircular(_ nums: [Int]) -> Int {

    var maxValue = 0
    var currentSum = 0
    var secondSum = 0
    var maxSum = Int.min
    var minSum = Int.max

    for num in nums {
        maxValue += num
        currentSum += num
        secondSum += num
        maxSum = max(maxSum, currentSum)
        currentSum = max(currentSum, 0)
        minSum = min(secondSum, minSum)
        secondSum = min(secondSum, 0)
    }
    return maxValue == minSum ? maxSum : max(maxSum, maxValue - minSum)
}

//func findMaxSub(_ nums: [Int], _ counter: Int) -> Int {
//    var maxVal = Int(Int32.min)
//    var maxEnd = 0
//    var start = 0
//    var end = 0
//    var s = 0
//    let counter = counter - 1
//
//    for index in 0..<nums.count {
//
//        maxEnd += nums[index]
//        if maxVal < maxEnd {
//            maxVal = maxEnd
//            start = s
//            end = index
//        }
//
//        if maxEnd < 0 {
//            maxEnd = 0
//            s = index + 1
//        }
//    }
//
//    var secondMax = Int(Int32.min)
//
//    if (counter > 0) {
//    secondMax = findMaxSub(Array(nums[end..<nums.count]+nums[0..<end]), counter)
//    }
//
//    return max(secondMax, maxVal)
//}

// TIME LIMIT EXCEEDED
//func maxSubarraySumCircular(_ nums: [Int]) -> Int {
//
//    var maxVal = Int(Int32.min)
//    var counter = 0
//
//
//
//    while counter < nums.count {
//        let tempNums = Array((nums + nums)[counter..<(counter + nums.count)])
//        maxVal = max(maxVal, findMaxSub(tempNums))
//        counter += 1
//    }
//
//    return maxVal
//}
//
//func findMaxSub(_ nums: [Int]) -> Int {
//    var max = Int(Int32.min)
//    var maxEnd = 0
//
//    for index in 0..<nums.count {
//
//        maxEnd += nums[index]
//        if max < maxEnd {
//            max = maxEnd
//        }
//
//        if maxEnd < 0 {
//            maxEnd = 0
//        }
//    }
//
//
//    return max
//}


maxSubarraySumCircular([1,-2,3,-2])
maxSubarraySumCircular([5,-3,5])
maxSubarraySumCircular([-3,-2,-3])
maxSubarraySumCircular([-2,4,-5,4,-5,9,4])

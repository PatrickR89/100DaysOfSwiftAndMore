import UIKit

func findShortestSubArray(_ nums: [Int]) -> Int {

    var occurencies = [Int: Int]()
    var firstIndices = [Int: Int]()
    var lastIndices = [Int: Int]()

    for (index, number) in nums.enumerated() {
        if occurencies[number] != nil {
            occurencies[number]! += 1
            lastIndices[number, default: 0] = index
        } else {
            occurencies[number, default: 0] += 1
            firstIndices[number, default: 0] = index
            lastIndices[number, default: 0] = index
        }
    }

    let degree = occurencies.values.max()
    guard degree! > 1 else { return 1 }
    occurencies = occurencies.filter { $0.value == degree}

    var minSubarray = nums.count

    for key in occurencies.keys {
        minSubarray = min(minSubarray, lastIndices[key]! - firstIndices[key]! + 1) 
    }
    return minSubarray
}

//func findShortestSubArray(_ nums: [Int]) -> Int {
//
//    var degree = 0
//    var occurencies = [Int: Int]()
//    var subarrayLength = nums.count
//
//
//    for index in 0..<nums.count {
//        var maxCount = 1
//        for secondIndex in index + 1..<nums.count {
//            if nums[index] == nums[secondIndex] {
//                maxCount += 1
//            }
//        }
//
//        occurencies[nums[index], default: 0] += 1
//
//        degree = max(maxCount, degree)
//    }
//
//    guard degree > 1 else {
//        return 1
//    }
//
//    occurencies = occurencies.filter {
//        $0.value >= degree
//    }
//
//    print(occurencies)
//
//    for key in occurencies.keys {
//        var counter = 0
//        var occPerKey = 1
//
//        while counter <= degree {
//            for index in 0..<nums.count {
//                if nums[index] == key {
//                    for secondIndex in index + 1..<nums.count {
//                        if nums[secondIndex] == key {
//                            occPerKey += 1
//                            print(nums[index...secondIndex])
//                            if occPerKey == degree {
//                                subarrayLength = min(subarrayLength, nums[index...secondIndex].count)
//                            }
//                        }
//                    }
//                }
//            }
//            counter += 1
//        }
//    }
//
//    return subarrayLength
//}

findShortestSubArray([1,2,2,3,1])
findShortestSubArray([1,2,2,3,1,4,2])
findShortestSubArray([2,1])
findShortestSubArray([10,1,7,2,10,5,8,4,9,4,10,8,8,1,5,6,8,9,2,1])

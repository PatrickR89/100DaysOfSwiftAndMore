import UIKit

func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {

    var remainders = [Int: Int]()
    remainders[0] = 1
    var result = 0
    var prefixSum = 0

    for num in nums {
        prefixSum = (prefixSum + num % k + k) % k
        result += remainders[prefixSum, default: 0]
        remainders[prefixSum, default: 0] += 1
    }


    // YIELDS WRONG RESULT FOR: [-1,2,9], 2

    //
    //    for number in nums {
    //        prefixSum = prefixSum + number
    //
    //        let remainder = prefixSum % k
    //
    //        result += remainders[remainder, default: 0]
    //
    //        remainders[remainder, default: 0] += 1
    //    }

    print(remainders)
    return result
}

subarraysDivByK([-1,2,9], 2)
subarraysDivByK([2,-2,2,-4], 6)


// TIME LIMIT EXCEEDED
//func subarraysDivByK(_ nums: [Int], _ k: Int) -> Int {
//
//    var divisibleSubarrays = 0
//
//    for index in nums.indices {
//        var pointer = nums.count - 1
//
//        while pointer >= index {
//
//            let result = nums[index...pointer].reduce(into: 0) { partialResult, value in
//                partialResult = partialResult + value
//            }
//
//            if result % k == 0 {
//                divisibleSubarrays += 1
//            }
//
//            pointer -= 1
//        }
//    }
//
//
//    return divisibleSubarrays
//}

subarraysDivByK([4,5,0,-2,-3,1], 5)
subarraysDivByK([5], 9)

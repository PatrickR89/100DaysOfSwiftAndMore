import UIKit

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

    var numArr = nums2
    var result = [Int]()

    for index in 0..<nums1.count {
        if let indexTwo = numArr.firstIndex(where: {$0 == nums1[index]}) {
            if !result.contains(nums1[index]) {
                result.append(nums1[index])
            }
            numArr.remove(at: indexTwo)
        }
    }

    return result
}

intersection([1,2,2,1], [2,2])
intersection([4,9,5], [9,4,9,8,4])

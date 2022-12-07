import UIKit

func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {

    var numArr: [Int] = nums2
    var result = [Int]()

    for index in 0..<nums1.count {
        if let indexTwo = numArr.firstIndex(where: {$0 == nums1[index]}) {
                result.append(nums1[index])

            numArr.remove(at: indexTwo)
        }
    }

    return result
}

intersect([1,2,2,1], [2,2])
intersect([4,9,5], [9,4,9,8,4])

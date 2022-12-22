import UIKit

func nextGreaterElement(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var result = [Int]()

    nums1.forEach { num in
        if let index = nums2.firstIndex(of: num) {
            if let greater = nums2[index..<nums2.count].firstIndex(where: { $0 > num}) {
                result.append(nums2[greater])
            } else {
                result.append(-1)
            }
        }
    }
    return result
}

nextGreaterElement([4,1,2], [1,3,4,2])
nextGreaterElement([1,3,5,2,4], [6,5,4,3,2,1,7])

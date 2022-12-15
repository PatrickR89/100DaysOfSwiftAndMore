import UIKit

func findDisappearedNumbers(_ nums: [Int]) -> [Int] {

    var result = [Int]()

    for i in 0..<nums.count {
        result.append(i + 1)
    }

//    for i in 0..<nums.count {
//        if let index = result.firstIndex(of: nums[i]) {
//            result.remove(at: index)
//        }
//    }

    for num in nums {
        result[num - 1] = -1
    }

    result = result.filter {
        $0 != -1
    }
    print(result)

    return result
}

findDisappearedNumbers([4,3,2,7,8,2,3,1])
findDisappearedNumbers([1,1])
findDisappearedNumbers([1,1,1,4,4,4])

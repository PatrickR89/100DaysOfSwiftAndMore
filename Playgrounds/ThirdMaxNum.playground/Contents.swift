import UIKit

func thirdMax(_ nums: [Int]) -> Int {

    var max: [String:Int] = [:]

    for num in nums {
        print(num)
        print(max)
        if max["large"] == nil {
            max["large"] = num
        } else if max["large"] != nil && num > max["large"]! {
            if let mid = max["medium"] {
                max["small"] = mid
            }
            max["medium"] = max["large"]!
            max["large"] = num
            print(max)
        } else if max["medium"] == nil && num < max["large"]! {
            max["medium"] = num
        } else if max["medium"] != nil && num > max["medium"]! && num < max["large"]! {
            max["small"] = max["medium"]
            max["medium"] = num

        } else if max["small"] == nil && max["medium"] != nil && num < max["medium"]! {
            max["small"] = num
        }  else if max["small"] != nil && num > max["small"]! && num < max["medium"]! {
            max["small"] = num
        }
    }
    print(max)

    return max["small"] ?? max["large"]!
}

thirdMax([3,2,1])
thirdMax([1, 2])
thirdMax([2,2,3,1])
thirdMax([1,2,-2147483648])

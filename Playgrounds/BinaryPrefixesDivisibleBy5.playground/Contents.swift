import UIKit

func prefixesDivBy5(_ nums: [Int]) -> [Bool] {

    var result = [Bool]()
    var currNum = 0
    for index in nums.indices {
        currNum = (currNum * 2 + nums[index]) % 5
        result.append(currNum == 0)
    }

    return result
}

/* MARK: did not take arr.length in account...
 func prefixesDivBy5(_ nums: [Int]) -> [Bool] {
         var result = [Bool]()

     for index in nums.indices {
         let stringValue = nums[0...index].map {String($0)}.joined()
         let value = Int(stringValue, radix: 2)!
         result.append(value % 5 == 0)
     }

     return result
     }
 */

prefixesDivBy5([0,1,1])
prefixesDivBy5([1,0,1,1,1,1,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,1,1,1,0,0,0,0,1,1,1,0,0,0,0,0,1,0,0,0,1,0,0,1,1,1,1,1,1,0,1,1,0,1,0,0,0,0,0,0,1,0,1,1,1,0,0,1,0])

import UIKit

func canThreePartsEqualSum(_ arr: [Int]) -> Bool {

    var sum = arr.reduce(into: 0) { partialResult, val in
        partialResult += val
    }

    if sum % 3 != 0 {
        return false
    }

    let partVal = sum / 3
    var partCounter = 0
    var currSum = 0
    print(arr)

    for index in 0..<arr.count {

        print("current: ",currSum, "+", arr[index])
        currSum += arr[index]

        if currSum == partVal && partCounter < 3 {
            partCounter += 1
            currSum = 0
        }
    }

    print("equal parts", partCounter)

    return partCounter == 3
}

canThreePartsEqualSum([0,2,1,-6,6,-7,9,1,2,0,1])
canThreePartsEqualSum([0,2,1,-6,6,7,9,-1,2,0,1])
canThreePartsEqualSum([3,3,6,5,-2,2,5,1,-9,4])
canThreePartsEqualSum([0,0,0,0])
canThreePartsEqualSum([10,-10,10,-10,10,-10,10,-10])
canThreePartsEqualSum([1,-1,1,-1])

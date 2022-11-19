import UIKit

func maxProfit(_ prices: [Int]) -> Int {

    var result = 0
    var buyPointer = 0
    var sellPointer = 1

    while sellPointer < prices.count {
        if prices[buyPointer] < prices[sellPointer] {
            let tempResult = prices[sellPointer] - prices[buyPointer]
            print(tempResult)
            result = max(result, tempResult)
        } else {
            buyPointer = sellPointer
        }

        sellPointer += 1
    }
// MARK: Timeout 
//    for (index, price) in prices.enumerated() {
//        if index < prices.count - 1 {
//            let nextIndex = index + 1
//
//            prices[nextIndex...].forEach {
//                if $0 - price > result {
//                    result = $0 - price
//                }
//            }
//        }
//    }

    return result
}

maxProfit([7,1,5,3,6,4])
maxProfit([7,6,4,3,1])
maxProfit([7,6,4,6,5,30, 50, 80, 123, 3,1])
maxProfit([1,2])

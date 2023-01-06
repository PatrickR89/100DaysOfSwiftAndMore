import UIKit

func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {

    var coins = coins
    var icecreamBars = 0
    let costs = costs.sorted()

    for cost in costs {
        if coins - cost >= 0 {
            icecreamBars += 1
            coins -= cost
        } else {
            break
        }
    }

    return icecreamBars
}

maxIceCream([1,3,2,4,1], 7)
maxIceCream([10,6,8,7,7,8], 5)
maxIceCream([1,6,3,1,2,5], 20)

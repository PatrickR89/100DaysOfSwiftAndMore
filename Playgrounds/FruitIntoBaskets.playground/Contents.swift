import UIKit

func totalFruit(_ fruits: [Int]) -> Int {

    var fruitsByType = [Int: Int]()
    var total = 0
    var current = 0
    var typeCount = 0
    var start = 0

    for index in fruits.indices {
        if fruitsByType[fruits[index], default: 0] == 0 { typeCount += 1 }
        fruitsByType[fruits[index], default: 0] += 1
        current += 1

        while typeCount > 2 && start < index {
            fruitsByType[fruits[start], default: 0] -= 1
            if fruitsByType[fruits[start], default: 0] == 0 {typeCount -= 1}
            start += 1
            current -= 1
        }

        total = max(total, current)
    }


    return total
}

totalFruit([1,2,3,2,2])
totalFruit([0,1,2,2])
totalFruit([3,3,3,1,2,1,1,2,3,3,4])


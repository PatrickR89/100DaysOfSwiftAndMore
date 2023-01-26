import UIKit

func minCostClimbingStairs(_ cost: [Int]) -> Int {

    var stepCost = [0, 0]

    for index in 2...cost.count {
        stepCost.append(min(stepCost[index - 1] + cost[index - 1], stepCost[index - 2] + cost[index - 2]))
    }



    return stepCost[stepCost.count - 1]
    }

minCostClimbingStairs([10,15,20])
minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1])

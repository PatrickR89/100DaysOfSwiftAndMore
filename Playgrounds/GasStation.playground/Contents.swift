import UIKit

func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {

    let eliminate = gas.reduce(into: 0) { $0 = $0 + $1} - cost.reduce(into: 0) { $0 = $0 + $1}
    if eliminate < 0 {
        return -1
    }
    var tank = 0
    var gasStation = 0

    for index in 0..<gas.count {
        if tank < 0 {
            tank = 0
            gasStation = index
        }

        tank += (gas[index] - cost[index])
    }

    return gasStation
}

canCompleteCircuit([1,2,3,4,5], [3,4,5,1,2])
canCompleteCircuit([2,3,4], [3,4,3])
canCompleteCircuit([3,3,4], [3,4,4])
canCompleteCircuit([5,1,2,3,4], [4,4,1,5,1])

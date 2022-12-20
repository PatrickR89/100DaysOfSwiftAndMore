import UIKit

func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {

    var poisonTime = 0

    for (index, time) in timeSeries.enumerated() {
        if index == timeSeries.count - 1 {
            poisonTime += duration
        } else {
            let freeTime = timeSeries[index+1] - time 
            freeTime < duration ? (poisonTime += freeTime) : (poisonTime += duration)
        }
    }

    return poisonTime
}

findPoisonedDuration([1,4], 2)
findPoisonedDuration([1, 2], 2)
findPoisonedDuration([1,2,3,4,5,6,7,8,9], 100000)

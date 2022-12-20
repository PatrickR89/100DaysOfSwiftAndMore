import UIKit

func findPoisonedDuration(_ timeSeries: [Int], _ duration: Int) -> Int {

    var poisonTime = 0
    let reversedAttack = Array(timeSeries.reversed())

    for (index, time) in reversedAttack.enumerated() {
        if index == 0 {
            poisonTime += duration
        } else {
            let freeTime = reversedAttack[index-1] - time
            freeTime < duration ? (poisonTime += freeTime) : (poisonTime += duration)
        }
    }

    return poisonTime
}

findPoisonedDuration([1,4], 2)
findPoisonedDuration([1, 2], 2)
findPoisonedDuration([1,2,3,4,5,6,7,8,9], 100000)

import UIKit

func minimumRounds(_ tasks: [Int]) -> Int {

    var taskCount = [Int:Int]()
    var rounds = 0

    tasks.forEach {
        taskCount[$0, default: 0] += 1
    }

    taskCount = taskCount.mapValues {

        return resolveTasks($0, &rounds)

    }

    return rounds
}

func resolveTasks( _ count: Int, _ rounds: inout Int) -> Int {
    var count = count
    if rounds > -1 {
        while count > 1 {
            if count > 4 {
                count -= 3
            } else if count % 3 == 0 {
                count -= 3
            } else if count % 2 == 0 {
                count -= 2
            }

            print(count)

            rounds += 1
        }
    }

    if count == 1 {
        rounds = -1
    }

    return count
}

minimumRounds([2,2,3,3,2,4,4,4,4,4])
minimumRounds([2,3,3])

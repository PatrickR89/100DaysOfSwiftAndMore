import UIKit

let hours = [8,4,2,1]
let minutes = [32, 16, 8, 4, 2, 1]

func readBinaryWatch(_ turnedOn: Int) -> [String] {
    var result = [String]()

    timeCounter(&result, time: (0, 0), num: turnedOn, starter_point: 0)

    return result
}

func timeCounter(_ result: inout [String], time: (Int, Int), num: Int, starter_point: Int) {
    var time = time
    var i = starter_point
    if num == 0 {
        let stringMins = time.1 < 10 ? ":0\(time.1)" : ":\(time.1)"
        let resultTime = "\(time.0)" + stringMins
        result.append(resultTime)
    }
    while i < (hours.count + minutes.count) {
        if i < hours.count {
            time.0 += hours[i]
            if time.0 < 12 {
                timeCounter(&result, time: time, num: num - 1, starter_point: i + 1)
            }
            time.0 -= hours[i]
        } else {
            time.1 += minutes[i - hours.count]
            if time.1 < 60 {
                timeCounter(&result, time: time, num: num - 1, starter_point: i + 1)
            }
            time.1 -= minutes[i - hours.count]
        }

        i += 1
    }

}

readBinaryWatch(1)
readBinaryWatch(5)
readBinaryWatch(9)

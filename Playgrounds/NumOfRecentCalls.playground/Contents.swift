import UIKit

class RecentCounter {

    var timer: [Int]

    init() {
        self.timer = []
    }

    func ping(_ t: Int) -> Int {
        timer.append(t)
        let frameStart = timer.firstIndex(where: { $0 >= (t - 3000)})!
        timer = Array(timer[frameStart...timer.count - 1])
        return timer.count
    }
}

let counter = RecentCounter()
counter.ping(1)
counter.ping(100)
counter.ping(3001)
counter.ping(3002)

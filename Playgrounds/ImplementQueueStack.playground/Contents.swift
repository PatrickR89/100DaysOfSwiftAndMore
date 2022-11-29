import UIKit

class MyQueue {

    var queue: [Int]

    init() {
        self.queue = [Int]()
    }

    func push(_ x: Int) {
        queue.append(x)
    }

    func pop() -> Int {
        return queue.removeFirst()
    }

    func peek() -> Int {
        guard let first = queue.first else {return 0}
        return first
    }

    func empty() -> Bool {
        return queue.isEmpty
    }
}

/**
 * Your MyQueue object will be instantiated and called as such:
 * let obj = MyQueue()
 * obj.push(x)
 * let ret_2: Int = obj.pop()
 * let ret_3: Int = obj.peek()
 * let ret_4: Bool = obj.empty()
 */

import UIKit

class MyHashSet {

    var set: [Int]

    init() {
        self.set = []
    }

    func add(_ key: Int) {
        if !set.contains(key){
            self.set.append(key)
        }
    }

    func remove(_ key: Int) {
        guard let index = set.firstIndex(of: key) else {return}
        set.remove(at: index)
    }

    func contains(_ key: Int) -> Bool {

        if set.contains(key) {
            return true
        }

        return false
    }
}

//["MyHashSet", "add", "add", "contains", "contains", "add", "contains", "remove", "contains"]
//[[], [1], [2], [1], [3], [2], [2], [2], [2]]

var mySet = MyHashSet()
mySet.add(1)
mySet.add(2)
mySet.contains(1)
mySet.contains(3)
mySet.add(2)
mySet.remove(2)
mySet.contains(2)


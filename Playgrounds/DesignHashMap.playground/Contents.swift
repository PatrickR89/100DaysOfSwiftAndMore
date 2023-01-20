import UIKit

class MyHashMap {

    var map: [[Int]]

    init() {
        self.map = [[],[]]

    }

    func put(_ key: Int, _ value: Int) {
        if !map[0].contains(key) {
            self.map[0].append(key)
            self.map[1].append(value)
        } else {
            guard let index = map[0].firstIndex(of: key) else {return}
            map[1][index] = value
        }
    }

    func get(_ key: Int) -> Int {
        guard let index = map[0].firstIndex(of: key) else {return -1}
        return map[1][index]
    }

    func remove(_ key: Int) {
        guard let index = map[0].firstIndex(of: key) else {return}
        map[0].remove(at: index)
        map[1].remove(at: index)
    }
}


//["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
//[[],         [1, 1], [2, 2], [1],   [3],  [2, 1], [2],    [2],    [2]]
//[null,        null,   null,   1,    -1,    null,   1,    null,    -1]

var myMap = MyHashMap()

myMap.put(1, 1)
myMap.put(2, 2)
myMap.get(1)
myMap.get(3)
myMap.put(2, 1)
myMap.get(2)
myMap.remove(2)
myMap.get(2)

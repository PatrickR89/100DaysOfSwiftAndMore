import UIKit

class DisjointedSet {
    var parent: [Int]

    init(size: Int) {
        self.parent = Array(0..<size)
    }

    func findNode(_ node: Int) -> Int {
        if node == parent[node] {
            return node
        } else {
            let parentNode = findNode(parent[node])
            parent[node] = parentNode
            return parentNode
        }
    }

    func union(_ firstNode: Int, _ secondNode: Int) {
        let firstNode = findNode(firstNode)
        let secondNode = findNode(secondNode)

        parent[firstNode] = secondNode
    }
}

func numberOfGoodPaths(_ vals: [Int], _ edges: [[Int]]) -> Int {

    let n = vals.count
    var tree = [Int: [Int]]()
    var nodeValues = [Int: [Int]]()
    var result = 0
    let disjointSet = DisjointedSet(size: n)

    for edge in edges {
        tree[edge[0], default: [Int]()].append(edge[1])
        tree[edge[1], default: [Int]()].append(edge[0])
    }

    for index in 0..<n {
        nodeValues[vals[index], default: [Int]()].append(index)
    }

    let sortedValues = nodeValues.keys.sorted()

    for value in sortedValues {
        for node in nodeValues[value]! {
            for child in tree[node] ?? [] {
                if vals[node] >= vals[child] {
                    disjointSet.union(node, child)
                }
            }
        }

        var unionSizes = [Int: Int]()

        for node in nodeValues[value]! {
            unionSizes[disjointSet.findNode(node), default: 0] += 1
        }

        for size in unionSizes.values {
            result += (size * (size + 1) / 2)
        }
    }

    return result
}

numberOfGoodPaths([1,3,2,1,3], [[0,1],[0,2],[2,3],[2,4]])
numberOfGoodPaths([1,1,2,2,3], [[0,1],[1,2],[2,3],[2,4]])

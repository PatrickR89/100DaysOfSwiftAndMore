import UIKit

func countSubTrees(_ n: Int, _ edges: [[Int]], _ labels: String) -> [Int] {

    let labels = Array(labels)

    var tree = [Int: [Int]]()

    var result = [Int]()

    for _ in 0..<n {
        result.append(0)
    }

    for edge in edges {
        tree[edge[0], default: []].append(edge[1])
        tree[edge[1], default: []].append(edge[0])
    }

    let subtree = findLabel(0, -1, tree, labels, &result)
    print(subtree)

    return result
}

func findLabel(_ node: Int, _ parent: Int, _ tree: [Int:[Int]], _ labels: [Character], _ result: inout [Int]) -> [Character: Int] {
    var subTree = [Character: Int]()

    subTree[labels[node], default: 0] += 1

    for neighbour in tree[node]! {
        if neighbour != parent {

            findLabel(neighbour, node, tree, labels, &result).forEach {
                subTree[$0.key, default: 0] += $0.value

            }
        }

    }

    result[node] = subTree[labels[node]]!
    return subTree
}



countSubTrees(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], "abaedcd")
countSubTrees(4, [[0,1],[1,2],[0,3]], "bbbb")
countSubTrees(5, [[0,1],[0,2],[1,3],[0,4]], "aabab")

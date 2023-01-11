import UIKit

func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
    var tree: [Int: [Int]] = [:]

    for vertex in edges {
        tree[vertex[0], default: [Int]()].append(vertex[1])
        tree[vertex[1], default: [Int]()].append(vertex[0])
    }

return max(searchForApples(node: 0, parent: -1, tree: tree, hasApple: hasApple) - 2, 0)
}

func searchForApples(node: Int, parent: Int, tree: [Int: [Int]], hasApple: [Bool]) -> Int {
    var time = 0

    for neighbour in tree[node]! {
        if neighbour != parent {
            time += searchForApples(node: neighbour, parent: node, tree: tree, hasApple: hasApple)
        }
    }

    if time > 0 || hasApple[node] {
        return time + 2
    }

    return time
}
//func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
//
//    if n == 0 || edges.isEmpty {
//        return 0
//    }
//
//    var vertexStack = [Int]()
//    var hasApples = [Int]()
//    var time: Int = 0
//
//    for index in hasApple.indices {
//        if hasApple[index] == true {
//            hasApples.append(index)
//        }
//    }
//    print(hasApples)
//    collectApples(vertex: 0, edges: edges, vertexStack: &vertexStack, time: &time, hasApples: hasApples)
//
//
//
//
//    return time == 0 ? 0 : time - 2
//}
//
//func collectApples(vertex: Int, edges: [[Int]], vertexStack: inout [Int], time: inout Int, hasApples: [Int]) -> Bool {
//
//    var children = [Bool]()
//
//    time += 1
//
//    vertexStack.append(vertex)
//
//    for nodeVertex in edges {
//        if nodeVertex[0] == vertex && !vertexStack.contains(nodeVertex[1]) {
//            let child = collectApples(vertex: nodeVertex[1], edges: edges, vertexStack: &vertexStack, time: &time, hasApples: hasApples)
//            children.append(child)
//        } else if nodeVertex[1] == vertex && !vertexStack.contains(nodeVertex[0]) {
//            let child = collectApples(vertex: nodeVertex[0], edges: edges, vertexStack: &vertexStack, time: &time, hasApples: hasApples)
//            children.append(child)
//        }
//    }
//
//    let hasTheApple = hasApples.contains(vertex)
//
//    if children.contains(true) || hasTheApple {
//        time += 1
//    } else {
//        time -= 1
//    }
//
//    vertexStack.removeLast()
//
//
//    return children.contains(true) || hasTheApple
//}

minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3]], [false,false,true,false,true,true,false])
minTime(7, [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], [false,false,true,false,false,true,false])
minTime(4, [[0,2], [0, 3], [1, 2]], [false, true, false, false])

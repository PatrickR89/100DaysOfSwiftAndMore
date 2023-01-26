import UIKit

func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {

    var node1 = node1
    var node2 = node2

    var visitedNodes1 = Set<Int>()
    var visitedNodes2 = Set<Int>()



    while node1 > -1 || node2 > -1 {
        let visited1 = visitedNodes2.contains(node1)
        let visited2 = visitedNodes1.contains(node2)
        if visited1 || visited2 || node1 == node2 {
            return visited1 && visited2 ? min(node1, node2) : (visited1 ? node1 : node2)
        }

        visitedNodes1.insert(node1)
        visitedNodes2.insert(node2)

        node1 = node1 > -1 && !visitedNodes1.contains(edges[node1]) ? edges[node1] : -1
        node2 = node2 > -1 && !visitedNodes2.contains(edges[node2]) ? edges[node2] : -1
    }

    return -1
}

/*
 var node1 = node1, node2 = node2
 var visited1 = Set<Int>(), visited2 = Set<Int>()
 while node1 > -1 || node2 > -1 {
 let (v1, v2) = (visited2.contains(node1), visited1.contains(node2))
 if v1 || v2 || node1 == node2 {
 return v1 && v2 ? min(node1, node2) : v1 ? node1 : node2
 }
 visited1.insert(node1)
 visited2.insert(node2)
 node1 = node1 > -1 && !visited1.contains(edges[node1]) ? edges[node1] : -1
 node2 = node2 > -1 && !visited2.contains(edges[node2]) ? edges[node2] : -1
 }
 return -1
 }

 */

closestMeetingNode([2,2,3,-1], 0, 1)
closestMeetingNode([1,2,-1], 0, 2)
closestMeetingNode([5,-1,3,4,5,6,-1,-1,4,3], 0, 0)
closestMeetingNode([4,4,4,5,1,2,2], 1, 1)
closestMeetingNode([2,0,0], 2, 0)

// TIME LIMIT EXCEEDED - BFS from solutions... ???????

//func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
//
//    let distanceOne = searchBFS(node1, edges)
//    let distanceTwo = searchBFS(node2, edges)
//
//    var commonNode = -1
//    var currentDistance = Int.max
//
//    for index in edges.indices {
//        if currentDistance > max(distanceOne[index], distanceTwo[index]) {
//            commonNode = index
//            currentDistance = max(distanceOne[index], distanceTwo[index])
//        }
//    }
//
//    return commonNode
//}
//
//func searchBFS(_ node: Int, _ edges: [Int]) -> [Int] {
//
//    var distance = Array(repeating: Int.max, count: edges.count)
//    var queue = [Int]()
//    queue.append(node)
//
//    var visited = [Int]()
//
//    distance[node] = 0
//
//    while !queue.isEmpty {
//        let currNode = queue.removeFirst()
//
//        if !visited.contains(currNode) {
//            visited.append(currNode)
//
//            let child = edges[currNode]
//
//            if child != -1 && !visited.contains(child) {
//                distance[child] = distance[currNode] + 1
//                queue.append(child)
//            }
//        }
//    }
//    return distance
//}




// TIME LIMIT EXCEEDED - trying to learn dijkstra...

//func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
//
//    var node1Distance = [Int: Int]()
//    var node2Distance = [Int: Int]()
//    var edgesDict = [Int: Int]()
//
//    for index in edges.indices {
//        edgesDict[index, default: 0] = edges[index]
//    }
//
//    dijkstra(edgesDict, node1, &node1Distance)
//    dijkstra(edgesDict, node2, &node2Distance)
//
//    var common = [Int: Int]()
//
//    node1Distance.keys.forEach { node in
//        if node2Distance.contains(where: {$0.key == node}) {
//            common[node] = max(node1Distance[node]!, node2Distance[node]!)
//        }
//    }
//
//    var commonNode = -1
//
//    if !common.isEmpty {
//        for node in common {
//            if node.value < common[commonNode, default: Int.max] {
//                commonNode = node.key
//            }
//        }
//    }
//
//    return commonNode
//}
//
//func dijkstra(_ edges: [Int: Int], _ node: Int, _ distances: inout [Int: Int]) {
//
//    var currentEdges = [Int: Int]()
//    var tempNode = node
//    while tempNode >= 0 && currentEdges[tempNode] == nil {
//        currentEdges[tempNode, default: -1] = edges[tempNode]!
//        tempNode = edges[tempNode]!
//    }
//
//    var queue = [Int]()
//    var visited = [Int]()
//    for vertex in currentEdges.keys {
//        distances[vertex] = Int.max
//        queue.append(vertex)
//
//    }
//
//    distances[node] = 0
//
//    while !queue.isEmpty {
//
//        var tempNode = -1
//
//        for value in queue {
//            if distances[value, default: Int.max] <= distances[tempNode, default: Int.max] {
//                tempNode = value
//            }
//        }
//
//        if let index = queue.firstIndex(of: tempNode) {
//            queue.remove(at: index)
//        }
//
//        visited.append(tempNode)
//
//        if queue.contains(currentEdges[tempNode]!) && !visited.contains(currentEdges[tempNode]!) {
//            let alternative = distances[tempNode]! + 1
//            if alternative < distances[currentEdges[tempNode]!]! {
//                distances[currentEdges[tempNode]!] = alternative
//            }
//        }
//
//    }
//
//    distances = distances.filter { $0.value != Int.max }
//}

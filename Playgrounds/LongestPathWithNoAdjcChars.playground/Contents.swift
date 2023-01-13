import UIKit


func longestPath(_ parent: [Int], _ s: String) -> Int {

    let s = Array(s)
    var result = 0
    var nodes = [Int: [Int]]()

    for (index, value) in parent.enumerated() {
        nodes[value, default: []].append(index)
        nodes[index, default: []].append(value)
    }
    print(nodes)
    calcDepth(0, -1 ,nodes, s, &result)

    return result
}

func calcDepth(_ node: Int,_ parent: Int, _ nodes: [Int: [Int]], _ s: [Character], _ result: inout Int) -> Int {

    var depth1 = 0
    var depth2 = 0

    var currMax = 0

    for child in nodes[node]! {
        if child != parent {
            currMax = calcDepth(child, node, nodes, s, &result)

            if s[child] == s[node] {
                continue
            }

            if currMax > depth1 {
                depth2 = depth1
                depth1 = currMax
            } else if currMax > depth2 {
                depth2 = currMax
            }
        }
    }

    result = max(result, 1 + depth1 + depth2)

    return 1 + depth1
}

longestPath([-1,0,0,1,1,2], "abacbe")
longestPath([-1,0,0,0], "aabc")

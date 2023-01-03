import UIKit


// Definition for a Node.
public class Node {
    public var val: Int
    public var children: [Node]
    public init(_ val: Int) {
        self.val = val
        self.children = []
    }
}

public struct Children {
    var content: [Node]
    var isAssigned: Bool

    init (_ content: [Node]) {
        self.content = content
        self.isAssigned = false
    }
}

public class RootNode {
    var root: Node?
    var source: [Node?]

    init(_ array: [Int?]) {
        self.source = array.map {
            if $0 != nil {
                return Node($0!)
            } else {
                return nil
            }
        }

        self.root = constructRoot()
        root
    }

    func constructRoot() -> Node {
        var nodeSource = source.split(maxSplits: source.count, omittingEmptySubsequences: false, whereSeparator: {$0 == nil}).map {return Array($0.map {return $0!})}.map { return Children($0)}

        for _ in 0 ..< nodeSource.count {
            for index in nodeSource.indices {
                nodeSource[index].content = nodeSource[index].content.map { node in
                    if let firstIndex = nodeSource[index + 1..<nodeSource.count].firstIndex(where: {$0.isAssigned == false}){
                        node.children = nodeSource[firstIndex].content
                        nodeSource[firstIndex].isAssigned = true
                    }

                    return node
                }
                nodeSource[index].isAssigned = false
            }
        }
        return nodeSource[0].content[0]
    }
}

var maxD = 0


func maxDepth(_ root: Node?) -> Int {

    guard let root = root else {return 0}
    var maximumDepth = 1
    maximumDepth = retrieveDepth(node: root, depth: maximumDepth)


    return maximumDepth
}

func retrieveDepth(node: Node,  depth: Int) -> Int {

    var tempDepth = depth + 1

    for child in node.children {
        let maxDepth = retrieveDepth(node: child, depth: tempDepth)
        maxD = max(maxD, maxDepth)
    }

    return max(maxD, depth)

}

let node0 = RootNode([1,nil,3,2,4,nil,5,6]).root
let node1 = RootNode([1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14]).root

maxDepth(node0)
maxDepth(node1)

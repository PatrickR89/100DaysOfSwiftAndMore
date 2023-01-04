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

func postorder(_ root: Node?) -> [Int] {

    var result = [Int]()

    traverse(root, &result)

    return result
}

func traverse(_ node: Node?, _ result: inout [Int]) {
    guard let node = node else {
        return
    }

    for child in node.children {
        traverse(child, &result)
    }

    result.append(node.val)
}
let node0 = RootNode([1,nil,3,2,4,nil,5,6]).root
let node1 = RootNode([1,nil,2,3,4,5,nil,nil,6,7,nil,8,nil,9,10,nil,nil,11,nil,12,nil,13,nil,nil,14]).root
postorder(node0)
postorder(node1)


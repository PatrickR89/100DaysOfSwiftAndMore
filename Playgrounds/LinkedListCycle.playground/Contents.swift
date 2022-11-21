import UIKit

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

//extension ListNode: Equatable {
//    public static func == (lhs: ListNode, rhs: ListNode) -> Bool {
//        return lhs.val == rhs.val && lhs.next == rhs.next
//    }
//}

func hasCycle(_ head: ListNode?) -> Bool {
    guard let head = head else {
        return false
    }

    var slow: ListNode? = head
    var fast: ListNode? = head

    while fast != nil && fast?.next != nil {
        fast = fast?.next?.next
        slow = slow?.next

        if fast === slow {
            return true
        }
    }


    return false
}

let node1 = setupNodeCycleList(list: [3,2,0,-4], pos: 1)
//let node2 = setupNodeCycleList(list:[1,2], pos:0)
//let node3 = setupNodeCycleList(list: [1], pos: -1)
hasCycle(node1)
//hasCycle(node2)
//hasCycle(node3)

func setupNodeCycleList(list: [Int], pos: Int) -> ListNode {
    let listNodes: [ListNode] = list.map {
        return ListNode($0)
    }

    let root = appendNextNode(fullList: listNodes, nodes: listNodes, pos: pos)

    return root
}

func appendNextNode(fullList: [ListNode], nodes: [ListNode], pos: Int) -> ListNode {
    let nodes = nodes

    for (index, node) in nodes.enumerated() {
        if index <= nodes.count - 2 {
            var range = index+1...nodes.count-1
            if range.count <= 1 {
                node.next = appendNextNode(fullList: fullList, nodes: [nodes[index + 1]], pos: pos)
            } else {
                node.next = appendNextNode(fullList: fullList, nodes: Array(nodes[range]), pos: pos)
            }

        }

        if index == nodes.count - 1 && pos >= 0 && pos < nodes.count - 1 {
            node.next = appendNextNode(fullList: fullList, nodes: Array(fullList[pos...nodes.count-1]), pos: pos)
        }
    }

    return nodes[0]
}

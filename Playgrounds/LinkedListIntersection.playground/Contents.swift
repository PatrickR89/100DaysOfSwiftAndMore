import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {

    if headA == nil || headB == nil {
        return nil
    }

    var pointerA = headA
    var pointerB = headB

    while pointerA !== pointerB {
        if pointerA == nil {
            pointerA = headB
        } else {
            pointerA = pointerA?.next
        }

        if pointerB == nil {
            pointerB = headA
        } else {
            pointerB = pointerB?.next
        }
    }

    return pointerA
}

func createLinkedLists(listA: [Int], listB: [Int], intersectionValue: Int, skipA: Int, skipB: Int) -> (ListNode?, ListNode?) {
    if listA.isEmpty && listB.isEmpty {
        return (nil, nil)
    }

    var sharedNodes = [ListNode]()
    var nodeListA = [ListNode]()
    var nodeListB = [ListNode]()

    if intersectionValue != 0 {
        sharedNodes = listA[skipA...listA.count - 1].reversed().map {
            return ListNode($0)
        }

        for index in sharedNodes.indices {
            if index > 0 {
                sharedNodes[index].next = sharedNodes[index - 1]
            }
        }

        sharedNodes.reverse()

        nodeListA = listA[0..<skipA].reversed().map {
            ListNode($0)
        }

        nodeListB = listB[0..<skipB].reversed().map {
            ListNode($0)
        }

        for index in nodeListA.indices {
            if index == 0 {
                nodeListA[index].next = sharedNodes[0]
            } else {
                nodeListA[index].next = nodeListA[index - 1]
            }
        }

        for index in nodeListB.indices {
            if index == 0 {
                nodeListB[index].next = sharedNodes[0]
            } else {
                nodeListB[index].next = nodeListB[index - 1]
            }
        }

    } else {
        nodeListA = listA.reversed().map {
            ListNode($0)
        }
        for index in nodeListA.indices {
            if index > 0 {
                nodeListA[index].next = nodeListA[index - 1]
            }
        }

        nodeListB = listB.reversed().map {
            ListNode($0)
        }
        for index in nodeListB.indices {
            if index > 0 {
                nodeListB[index].next = nodeListB[index - 1]
            }
        }

    }



    let headA = nodeListA[nodeListA.count - 1]
    let headB = nodeListB[nodeListB.count - 1]

    return (headA, headB)
}

let nodeSet1 = createLinkedLists(listA: [4,1,8,4,5], listB: [5,6,1,8,4,5], intersectionValue: 8, skipA: 2, skipB: 3)
let nodeSet2 = createLinkedLists(listA: [1,9,1,2,4], listB: [3,2,4], intersectionValue: 2, skipA: 3, skipB: 1)
let nodeSet3 = createLinkedLists(listA: [2,6,4], listB: [1,5], intersectionValue: 0, skipA: 3, skipB: 2)

getIntersectionNode(nodeSet1.0, nodeSet1.1)
getIntersectionNode(nodeSet2.0, nodeSet2.1)
getIntersectionNode(nodeSet3.0, nodeSet3.1)

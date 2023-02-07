import UIKit

public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

func setupNodeList(list: [Int]) -> ListNode? {
    var listNodes = [ListNode?]()
    for (index, val) in list.reversed().enumerated() {
        if index == 0 {
            listNodes.append(ListNode(val))
        } else if index > 0 {
            listNodes.append(ListNode(val, listNodes[index - 1]))
        }
    }

    return listNodes[listNodes.count - 1]
}

func swapPairs(_ head: ListNode?) -> ListNode? {

    guard let head = head else { return nil }

    var nodeStack = [Int]()
    var tempNode: ListNode? = head

    while tempNode != nil {
        nodeStack.append(tempNode!.val)
        tempNode = tempNode?.next
    }

    var index = 0

    while index + 1 < nodeStack.count {
        (nodeStack[index], nodeStack[index + 1]) = (nodeStack[index + 1], nodeStack[index])
        index += 2
    }

    let newHead = setupNodeList(list: nodeStack)

    return newHead
}

let node1 = setupNodeList(list: [1,2,3,4])
swapPairs(node1)
swapPairs(nil)
swapPairs(ListNode(1))

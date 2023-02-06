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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

    var currHead = head
    var nodeList = [Int]()

    while currHead != nil {
        nodeList.append(currHead!.val)
        currHead = currHead?.next
    }

    nodeList.remove(at: nodeList.count - n)

    return nodeList.count > 0 ? setupNodeList(list: nodeList) : nil
}

let node1 = setupNodeList(list: [1,2,3,4,5])
let node2 = setupNodeList(list: [1])
let node3 = setupNodeList(list: [1,2])

removeNthFromEnd(node1, 2)
removeNthFromEnd(node2, 1)
removeNthFromEnd(node3, 1)

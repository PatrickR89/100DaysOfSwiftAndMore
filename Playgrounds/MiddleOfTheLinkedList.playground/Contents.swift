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

func middleNode(_ head: ListNode?) -> ListNode? {

    var firstPointer = head
    var secondPointer = head

    while secondPointer?.next != nil {

        firstPointer = firstPointer?.next
        secondPointer = secondPointer?.next?.next

        print(firstPointer?.val, secondPointer?.val)
    }

    return firstPointer
}

let node1 = setupNodeList(list: [1,2,3,4,5])
let node2 = setupNodeList(list: [1,2,3,4,5,6])

middleNode(node1)
middleNode(node2)

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

let node1 = setupNodeList(list: [1,2,2,1])
let node2 = setupNodeList(list: [1,2])

func isPalindrome(_ head: ListNode?) -> Bool {

    var slowPointer: ListNode? = head
    var fastPointer: ListNode? = head
    var nextNode: ListNode? = ListNode()
    var prevNode: ListNode? = ListNode()

    while fastPointer != nil && fastPointer?.next != nil {
        fastPointer = fastPointer?.next?.next
        slowPointer = slowPointer?.next
    }

    prevNode = slowPointer
    slowPointer = slowPointer?.next
    prevNode?.next = nil

    while slowPointer != nil {
        nextNode = slowPointer?.next
        slowPointer?.next = prevNode
        prevNode = slowPointer
        slowPointer = nextNode
    }

    fastPointer = head
    slowPointer = prevNode

    while slowPointer != nil {
        if fastPointer?.val != slowPointer?.val {return false}
        fastPointer = fastPointer?.next
        slowPointer = slowPointer?.next
    }

    return true
}

isPalindrome(node1)
isPalindrome(node2)

import UIKit


//  Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

    func deleteDuplicates(_ head: ListNode?) -> ListNode? {

        var curr = head
        while curr != nil {
            if curr?.next != nil && curr?.val == curr?.next?.val {
                curr?.next = curr?.next?.next
            } else {
                curr = curr?.next
            }
        }
        return head
    }

var list1 = [1,1,2]
var list2 = [1,1,2,3,3]
var list3 = [1, 1, 1]

var nodeList1 = setupNodeList(list: list1)
var nodeList2 = setupNodeList(list: list2)
var nodeList3 = setupNodeList(list: list3)

func setupNodeList(list: [Int]) -> [ListNode?] {
    var listNodes = [ListNode?]()
    for (index, val) in list.reversed().enumerated() {
        if index == 0 {
            listNodes.append(ListNode(val))
        } else if index > 0 {
            listNodes.append(ListNode(val, listNodes[index - 1]))
        }
    }

    return listNodes.reversed()
}

    deleteDuplicates(nodeList1[0])
    deleteDuplicates(nodeList2[0])
    deleteDuplicates(nodeList3[0])

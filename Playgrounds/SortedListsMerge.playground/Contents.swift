import UIKit

//  Definition for singly-linked list.
  public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
  }

    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {

        guard let list1 = list1 else {
            merged.append(list2)
            return list2
        }

        guard let list2 = list2 else {
            merged.append(list1)
            return list1
        }

        if list1.val <= list2.val {
            list1.next = mergeTwoLists(list1.next, list2)
            merged.append(list1)
            return list1
        } else {
            list2.next = mergeTwoLists(list1, list2.next)
            merged.append(list2)
            return list2
        }
    }

var list1 = [1,2,4]
var list2 = [1,3,4]
var merged = [ListNode?]()

var nodeList1 = [ListNode?]()
var nodeList2 = [ListNode?]()

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

nodeList1 = setupNodeList(list: list1)
nodeList2 = setupNodeList(list: list2)

mergeTwoLists(nodeList1[0], nodeList2[0])

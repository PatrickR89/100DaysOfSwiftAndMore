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

    if head == nil {
        return false
    }

    var nums = [Int]()

    var node: ListNode? = head

    while node != nil {
        nums.append(node!.val)
        node = node?.next
    }

    if nums.count == 1 {
        return true
    }

    let half = (nums.count - 1) / 2
    let firstHalf = Array(nums[0...half])
    let seconHalf = Array(nums[half + 1...nums.count - 1].reversed())


    for (index, num) in seconHalf.enumerated() {
        if num != firstHalf[index] {
            return false
        }

        continue
    }

    return true
}

isPalindrome(node1)
isPalindrome(node2)

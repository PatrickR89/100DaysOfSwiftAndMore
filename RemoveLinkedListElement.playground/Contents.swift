import UIKit

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
    if head == nil {
        return nil
    }

    var node = head

    var filteredNodes = [ListNode]()

    while node != nil {
        if node?.val != val {
            if filteredNodes.isEmpty {
                filteredNodes.append(node!)
            } else {
                filteredNodes.insert(node!, at: 0)
            }
        }

        node = node?.next
    }
    if !filteredNodes.isEmpty {
        for index in filteredNodes.indices {
            if index == 0 {
                filteredNodes[index].next = nil
            }
            if index > 0 {
                filteredNodes[index].next = filteredNodes[index - 1]
            }
        }

        return filteredNodes[filteredNodes.count - 1]
    } else {
        return nil
    }

}

func createHead(nums: [Int]) -> ListNode? {
    if nums.isEmpty {
        return nil
    }

    var head = ListNode(nums[nums.count - 1])

    for index in Array(nums.reversed()).indices {

        if index > 0 {

            let tempNode = ListNode(Array(nums.reversed())[index])
            tempNode.next = head
            head = tempNode
        }
    }

    return head
}

let node1 = createHead(nums: [1,2,6,3,4,5,6])
let node2 = createHead(nums: [7,7,7,7])

removeElements(node1, 6)
removeElements(node2, 7)

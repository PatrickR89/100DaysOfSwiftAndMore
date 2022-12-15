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

func reverseList(_ head: ListNode?) -> ListNode? {

    if head == nil {
        return nil
    }

    var tempList = [ListNode]()
    var tempNode = head

    while tempNode != nil {
        tempList.append(tempNode!)
        tempNode = tempNode?.next
    }

    for index in tempList.indices {
        if index == 0 {
            tempList[index].next = nil
        }

        if index > 0 {
            tempList[index].next = tempList[index - 1]
        }
    }

    return tempList[tempList.count - 1]
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

let node1 = createHead(nums: [1,2,3,4,5])
let node2 = createHead(nums: [1,2])

reverseList(node1)
reverseList(node2)

@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct ReverseLinkedListTests {
    @Test func example1() {
        let sut = ReverseLinkedList()
        let input = ReverseLinkedList.ListNode.makeList([1, 2, 3, 4, 5])
        let output = sut.reverseList(input)
        #expect(output?.toArray() == [5, 4, 3, 2, 1])
    }
    @Test func example2() {
        let sut = ReverseLinkedList()
        let input = ReverseLinkedList.ListNode.makeList([1, 2])
        let output = sut.reverseList(input)
        #expect(output?.toArray() == [2, 1])
    }
    @Test func example3() {
        let sut = ReverseLinkedList()
        let input = ReverseLinkedList.ListNode.makeList([])
        let output = sut.reverseList(input)
        #expect(output == nil)
    }
}

extension ReverseLinkedList.ListNode {
    static func makeList(_ values: [Int]) -> ReverseLinkedList.ListNode? {
        var head: ReverseLinkedList.ListNode?
        for value in values.reversed() {
            head = ReverseLinkedList.ListNode(value, head)
        }
        return head
    }

    func toArray() -> [Int] {
        var values: [Int] = []
        var node: ReverseLinkedList.ListNode? = self
        while let current = node {
            values.append(current.val)
            node = current.next
        }
        return values
    }
}


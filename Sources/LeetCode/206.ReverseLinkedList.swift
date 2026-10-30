class ReverseLinkedList {

    class ListNode: CustomStringConvertible {
        var val: Int
        var next: ListNode?

        var description: String {
            "value: \(val), next: \(next?.description ?? "nil")"
        }

        init() {
            self.val = 0
            self.next = nil
        }
        init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        init(_ val: Int, _ next: ListNode?) {
            self.val = val
            self.next = next
        }
    }

    func reverseList(_ head: ListNode?) -> ListNode? {
        reverseList0(head)
    }

    private func reverseList0(_ head: ListNode?) -> ListNode? {
        fatalError()
    }
}

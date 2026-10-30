@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct RemoveAllAdjacentDuplicatesInString2Tests {
    @Test func example1() {
        let sut = RemoveAllAdjacentDuplicatesInString2()
        let output = sut.removeDuplicates("abcd", 2)
        #expect(output == "abcd")
    }

    @Test func example2() {
        let sut = RemoveAllAdjacentDuplicatesInString2()
        let output = sut.removeDuplicates("deeedbbcccbdaa", 3)
        #expect(output == "aa")
    }

    @Test func example3() {
        let sut = RemoveAllAdjacentDuplicatesInString2()
        let output = sut.removeDuplicates("pbbcggttciiippooaais", 2)
        #expect(output == "ps")
    }
}

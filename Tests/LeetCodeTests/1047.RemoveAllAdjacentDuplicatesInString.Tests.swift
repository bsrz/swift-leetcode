@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct RemoveAllAdjacentDuplicatesInStringTests {
    @Test func example1() {
        let sut = RemoveAllAdjacentDuplicatesInString()
        let output = sut.removeDuplicates("abbaca")
        #expect(output == "ca")
    }

    @Test func example2() {
        let sut = RemoveAllAdjacentDuplicatesInString()
        let output = sut.removeDuplicates("azxxzy")
        #expect(output == "ay")
    }

    @Test func example3() {
        let sut = RemoveAllAdjacentDuplicatesInString()
        let output = sut.removeDuplicates("aababaab")
        #expect(output == "ba")
    }

    // MARK: - My Cases
    @Test func `my case 1`() {
        let sut = RemoveAllAdjacentDuplicatesInString()
        let output = sut.removeDuplicates("abcde")
        #expect(output == "abcde")
    }
}

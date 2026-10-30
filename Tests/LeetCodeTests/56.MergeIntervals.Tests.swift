@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct MergeIntervalsTests {
    /// Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
    @Test func example1() {
        let sut = MergeIntervals()
        let output = sut.merge([[1, 3], [2, 6], [8, 10], [15, 18]])
        #expect(output == [[1, 6], [8, 10], [15, 18]])
    }

    /// Explanation: Intervals [1,4] and [4,5] are considered overlapping.
    @Test func example2() {
        let sut = MergeIntervals()
        let output = sut.merge([[1, 4], [4, 5]])
        #expect(output == [[1, 5]])
    }

    /// Explanation: Intervals [1,4] and [4,7] are considered overlapping.
    @Test func example3() {
        let sut = MergeIntervals()
        let output = sut.merge([[4, 7], [1, 4]])
        #expect(output == [[1, 7]])
    }

    @Test func example4() {
        let sut = MergeIntervals()
        let output = sut.merge([[1, 4], [0, 5]])
        #expect(output == [[0, 5]])
    }

    @Test func example5() {
        let sut = MergeIntervals()
        let output = sut.merge([[2, 3], [4, 5], [6, 7], [8, 9], [1, 10]])
        #expect(output == [[1, 10]])
    }
}

@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct InsertIntervalTests {
    @Test func example1() {
        let sut = InsertInterval()
        let output = sut.insert([[1, 3], [6, 9]], [2, 5])
        #expect(output == [[1, 5], [6, 9]])
    }

    @Test func example2() {
        let sut = InsertInterval()
        let output = sut.insert([[1, 2], [3, 5], [6, 7], [8, 10], [12, 16]], [4, 8])
        #expect(output == [[1, 2], [3, 10], [12, 16]])
    }

    @Test func example3() {
        let sut = InsertInterval()
        let output = sut.insert([[1, 5]], [2, 3])
        #expect(output == [[1, 5]])
    }

    // My test cases

    @Test func `my example 1`() {
        let sut = InsertInterval()
        let output = sut.insert([[6, 7], [8, 10], [12, 16]], [1, 2])
        #expect(output == [[1, 2], [6, 7], [8, 10], [12, 16]])
    }

    @Test func `my example 2`() {
        let sut = InsertInterval()
        let output = sut.insert([[6, 7], [8, 10], [12, 16]], [1, 6])
        #expect(output == [[1, 7], [8, 10], [12, 16]])
    }
}

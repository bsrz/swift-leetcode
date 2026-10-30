@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct NumberOfIslandsTests {
    @Test func example1() {
        let input: [[Character]] = [
            ["1", "1", "1", "1", "0"],
            ["1", "1", "0", "1", "0"],
            ["1", "1", "0", "0", "0"],
            ["0", "0", "0", "0", "0"],
        ]

        let sut = NumberOfIslands()

        #expect(sut.numIslands(input) == 1)
    }
}

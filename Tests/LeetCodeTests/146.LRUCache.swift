@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct LRUCacheTest {
    @Test func example1() {
        let sut = LRUCache(2)
        sut.put(1, 1)
        sut.put(2, 2)
        #expect(sut.get(1) == 1)
        sut.put(3, 3)
        #expect(sut.get(2) == -1) 
        sut.put(4, 4)
        #expect(sut.get(1) == -1)
        #expect(sut.get(3) == 3)
        #expect(sut.get(4) == 4)
    }

    @Test func example2() {
        let sut = LRUCache(2);
        #expect(sut.get(2) == -1)
        sut.put(2, 6)
        #expect(sut.get(1) == -1)
        sut.put(1, 5)
        sut.put(1, 2)
        #expect(sut.get(1) == 2 )
        #expect(sut.get(2) == 6)
    }

    @Test func example3() {
        let sut = LRUCache(1)
        sut.put(2, 1)
        #expect(sut.get(2) == 1)
        sut.put(3, 2)
        #expect(sut.get(2) == -1)
        #expect(sut.get(3) == 2)
    }

    @Test func example4() {
        let sut = LRUCache(3)
        sut.put(1, 1)
        sut.put(2, 2)
        sut.put(3, 3)
        sut.put(4, 4)
        #expect(sut.get(4) == 4)
        #expect(sut.get(3) == 3)
        #expect(sut.get(2) == 2)
        #expect(sut.get(1) == -1)
        sut.put(5, 5)
        #expect(sut.get(1) == -1)
        #expect(sut.get(2) == 2)
        #expect(sut.get(3) == 3)
        #expect(sut.get(4) == -1)
        #expect(sut.get(5) == 5)
    }
}

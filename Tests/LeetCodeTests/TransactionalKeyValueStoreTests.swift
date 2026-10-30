@testable import LeetCode
import TestingPerformance
import Testing

@Suite(.timed(), .serialized)
struct TransactionalKeyValueStoreTests {

    let store = TransactionalKeyValueStore<String, Int>()

    @Test("Nested transactions: rollback only undoes the innermost one")
    func nestedRollback() {
        store.set(10, for: "a")

        store.begin()
        store.set(20, for: "a")
        store.set(20, for: "b")
        #expect(store.count(20) == 2, "two keys hold 20 inside the outer transaction")

        store.begin()
        store.set(30, for: "a")
        #expect(store.get("a") == 30, "inner write is visible")
        #expect(store.count(20) == 1, "a moved from 20 to 30")
        #expect(store.count(30) == 1, "one key holds 30")

        #expect(store.rollback(), "inner rollback succeeds")
        #expect(store.get("a") == 20, "a restored to the outer transaction's value")
        #expect(store.count(20) == 2, "count of 20 restored")
        #expect(store.count(30) == 0, "30 is gone")

        #expect(store.rollback(), "outer rollback succeeds")
        #expect(store.get("a") == 10, "a restored to its original value")
        #expect(store.get("b") == nil, "b never existed before the transaction")
        #expect(store.count(20) == 0, "nothing holds 20")
        #expect(store.count(10) == 1, "a holds 10 again")

        #expect(!store.rollback(), "rollback with no open transaction returns false")
    }

    @Test("Same key written several times, new keys, setting a key to its current value")
    func multipleWritesAndNewKeys() {
        store.set(1, for: "x")

        store.begin()
        store.set(2, for: "x")
        store.set(3, for: "x")
        store.set(4, for: "x")       // x written three times in one transaction
        store.set(5, for: "y")       // new key
        store.set(5, for: "z")       // new key
        #expect(store.count(5) == 2, "y and z hold 5")
        #expect(store.count(1) == 0, "x no longer holds 1")
        #expect(store.count(4) == 1, "x holds 4")

        store.set(5, for: "y")       // same value again: count must not change
        #expect(store.count(5) == 2, "re-setting the same value doesn't change the count")

        #expect(store.rollback(), "rollback succeeds")
        #expect(store.get("x") == 1, "x restored to its value before the transaction, not an intermediate one")
        #expect(store.get("y") == nil, "y removed, not left as a stale entry")
        #expect(store.get("z") == nil, "z removed")
        #expect(store.count(1) == 1, "x holds 1 again")
        #expect(store.count(3) == 0, "intermediate value 3 not counted")
        #expect(store.count(4) == 0, "4 not counted")
        #expect(store.count(5) == 0, "5 not counted")
    }

    @Test("Commit closes all transactions and becomes the new baseline")
    func commit() {
        #expect(!store.commit(), "commit with no open transaction returns false")
        #expect(!store.rollback(), "rollback with no open transaction returns false")

        store.begin()
        store.set(1, for: "a")
        store.begin()
        store.set(1, for: "b")
        store.set(2, for: "a")
        #expect(store.count(1) == 1, "only b holds 1")
        #expect(store.count(2) == 1, "a holds 2")

        #expect(store.commit(), "commit succeeds")
        #expect(store.get("a") == 2, "a persisted")
        #expect(store.get("b") == 1, "b persisted")
        #expect(!store.rollback(), "commit closed every transaction")
        #expect(!store.commit(), "nothing left to commit")

        store.begin()
        store.set(3, for: "a")
        #expect(store.rollback(), "new transaction rolls back")
        #expect(store.get("a") == 2, "rolls back to the committed value")
        #expect(store.count(2) == 1, "count reflects the committed state")
        #expect(store.count(3) == 0, "rolled-back value not counted")
    }

    @Test("get returns the requested key, not the most recent write")
    func getMatchesKey() {
        store.begin()
        store.set(1, for: "a")
        store.set(2, for: "b")
        #expect(store.get("a") == 1)
        #expect(store.get("c") == nil, "c was never set")
    }

    @Test("get falls back to committed values inside a transaction")
    func getFallsBackToBaseline() {
        store.set(10, for: "a")
        store.begin()
        #expect(store.get("a") == 10)
        store.set(5, for: "b")
        #expect(store.get("a") == 10)
    }

    @Test("count includes committed keys inside a transaction")
    func countIncludesBaseline() {
        store.set(10, for: "a")
        store.set(10, for: "b")
        store.begin()
        store.set(20, for: "b")
        #expect(store.count(10) == 1, "a still holds 10")
        #expect(store.count(20) == 1, "b holds 20")
    }

    @Test("Large transaction stays fast")
    func performance() {
        let n = 5_000
        store.begin()
        for i in 0..<n { store.set(i, for: "k\(i)") }

        let elapsed = ContinuousClock().measure {
            for i in 0..<n {
                _ = store.get("k\(i)")
                _ = store.count(i)
            }
        }
        #expect(elapsed < .seconds(2), "took \(elapsed)")
    }
}

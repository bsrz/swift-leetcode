class TransactionalKeyValueStore<Key: Hashable, Value> {

    private let inner = TransactionalKeyValueStore0<Key, Value>()

    init() { }

    /// Return how many keys currently hold this value
    func count(_ value: Value) -> Int {
        inner.count(value)
    }

    /// Return the current value, or nil if the key doesn’t exist
    func get(_ key: Key) -> Value? {
        inner.get(key)
    }

    /// Add or overwrite the value for a key
    func set(_ value: Value, for key: Key) {
        inner.set(value, for: key)
    }

    /// Start a new transaction. Transactions can be nested.
    func begin() {
        inner.begin()
    }

    /// Make all open transactions permanent and close them. Returns false if no transaction is open.
    @discardableResult
    func commit() -> Bool {
        inner.commit()
    }

    /// Undo every change made in the innermost open transaction only. Returns false if no transaction is open.
    @discardableResult
    func rollback() -> Bool {
        inner.rollback()
    }
}

private class TransactionalKeyValueStore0<Key: Hashable, Value> {

    /// Return how many keys currently hold this value
    func count(_ value: Value) -> Int {
        fatalError()
    }

    /// Return the current value, or nil if the key doesn’t exist
    func get(_ key: Key) -> Value? {
        fatalError()
    }

    /// Add or overwrite the value for a key
    func set(_ value: Value, for key: Key) {
        fatalError()
    }

    /// Start a new transaction. Transactions can be nested.
    func begin() {
        fatalError()
    }

    /// Make all open transactions permanent and close them. Returns false if no transaction is open.
    @discardableResult
    func commit() -> Bool {
        fatalError()
    }

    /// Undo every change made in the innermost open transaction only. Returns false if no transaction is open.
    @discardableResult
    func rollback() -> Bool {
        fatalError()
    }
}

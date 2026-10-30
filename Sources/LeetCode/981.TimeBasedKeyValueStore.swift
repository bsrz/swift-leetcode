class TimeMap {

    private let inner = TimeMap0()

    init() { }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        inner.set(key, value, timestamp)
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        inner.get(key, timestamp)
    }
}


private class TimeMap0 {

    init() { }

    func set(_ key: String, _ value: String, _ timestamp: Int) {
        fatalError()
    }

    func get(_ key: String, _ timestamp: Int) -> String {
        fatalError()
    }
}

@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct TimeBasedKeyValueStoreTests {
    @Test func example1() {
        let sut = TimeMap()
        var output: [String?] = []

        sut.set("foo", "bar", 1)
        output.append(sut.get("foo", 1))
        output.append(sut.get("foo", 3))

        sut.set("foo", "bar2", 4)
        output.append(sut.get("foo", 4))
        output.append(sut.get("foo", 5))

        #expect(output == ["bar", "bar", "bar2", "bar2"])
    }

    @Test func example2() {
        let sut = TimeMap()
        var output: [String?] = []

        sut.set("pp","pp",1)
        output.append(sut.get("pp",2))
        output.append(sut.get("pp",3))
        sut.set("pp","pp",4)
        output.append(sut.get("pp",5))
        output.append(sut.get("pp",6))
        output.append(sut.get("pp",7))
        sut.set("pp","pp",8)
        output.append(sut.get("pp",9))
        sut.set("pp","pp",10)
        output.append(sut.get("pp",11))
        sut.set("pp","pp",12)
        output.append(sut.get("pp",13))
        output.append(sut.get("pp",14))
        output.append(sut.get("pp",15))
        output.append(sut.get("pp",16))
        sut.set("pp","pp",17)
        output.append(sut.get("pp",18))
        output.append(sut.get("pp",19))
        sut.set("pp","pp",20)
        output.append(sut.get("pp",21))
        output.append(sut.get("pp",22))
        output.append(sut.get("pp",23))
        output.append(sut.get("pp",24))
        output.append(sut.get("pp",25))
        sut.set("pp","pp",26)
        output.append(sut.get("pp",27))
        output.append(sut.get("pp",28))
        sut.set("pp","pp",29)
        sut.set("pp","pp",30)
        sut.set("pp","pp",31)
        output.append(sut.get("pp",32))
        output.append(sut.get("pp",33))
        output.append(sut.get("pp",34))
        sut.set("pp","pp",35)
        sut.set("pp","pp",36)
        output.append(sut.get("pp",37))
        output.append(sut.get("pp",38))
        output.append(sut.get("pp",39))
        sut.set("pp","pp",40)
        output.append(sut.get("pp",41))
        sut.set("pp","pp",42)
        output.append(sut.get("pp",43))
        sut.set("pp","pp",44)
        output.append(sut.get("pp",45))
        output.append(sut.get("pp",46))
        sut.set("pp","pp",47)
        output.append(sut.get("pp",48))
        sut.set("pp","pp",49)
        output.append(sut.get("pp",50))
        sut.set("pp","pp",51)
        output.append(sut.get("pp",52))
        output.append(sut.get("pp",53))
        output.append(sut.get("pp",54))
        sut.set("pp","pp",55)
        output.append(sut.get("pp",56))
        output.append(sut.get("pp",57))
        sut.set("pp","pp",58)
        sut.set("pp","pp",59)
        output.append(sut.get("pp",60))

        #expect(output == [
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp"),
            Optional("pp")
        ])
    }
}

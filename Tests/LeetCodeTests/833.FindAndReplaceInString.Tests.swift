@testable import LeetCode
import Testing
import TestingPerformance

@Suite(.timed(), .serialized)
struct FindAndReplaceInStringTests {
    @Test func example1() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString("abcd", [0, 2], ["a", "cd"], ["eee", "ffff"])
        #expect(output == "eeebffff")
    }

    @Test func example2() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString("abcd", [0, 2], ["ab", "ec"], ["eee", "ffff"])
        #expect(output == "eeecd")
    }

    @Test func example3() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString("vmokgggqzp", [3, 5, 1], ["kg", "ggq", "mo"], ["s", "so", "bfr"])
        #expect(output == "vbfrssozp")
    }

    @Test func example4() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString("abcde", [2, 2, 3], ["cde", "cdef", "dk"], ["fe", "f", "xyz"])
        #expect(output == "abfe")
    }

    @Test func example5() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString(
            "mhnbzxkwzxtaanmhtoirxheyanoplbvjrovzudznmetkkxrdmr",
            [46,     29,   2,       44,    31,   26,    42,    9,     38,    23,    36,   12,    16,   7,    33,   18],
            ["rym",  "kv", "nbzxu", "vx",  "js", "tp",  "tc",  "jta", "zqm", "ya",  "uz", "avm", "tz", "wn", "yv", "ird"],
            ["gfhc", "uq", "dntkw", "wql", "s",  "dmp", "jqi", "fp",  "hs",  "aqz", "ix", "jag", "n",  "l",  "y",  "zww"]
        )
        #expect(output == "mhnbzxkwzxtaanmhtoirxheaqznoplbvjrovzudznmetkkxrdmr")
    }

    @Test func example6() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString("abcde", [2, 2], ["cdef", "bc"], ["f", "fe"])
        #expect(output == "abcde")
    }

    @Test func example7() {
        let sut = FindAndReplaceInString()
        let output = sut.findReplaceString("abcde", [2, 2], ["bc", "cde"], ["fe", "f"])
        #expect(output == "abf")
    }
}

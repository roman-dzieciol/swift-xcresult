import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(InfoPlistTests.allTests),
        testCase(TestSummariesPlists.allTests),
    ]
}
#endif

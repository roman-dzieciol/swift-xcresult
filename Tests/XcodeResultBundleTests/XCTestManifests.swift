import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SchemeActionsInvocationRecordTests.allTests),
    ]
}
#endif

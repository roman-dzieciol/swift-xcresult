import XCTest
@testable import SWXCResult


final class TestSummariesPlistTests: XCTestCase {

    func testCodable() throws {
        do {
            let bundleDirURL = try generateResultBundles()
            let inputURL = bundleDirURL.appendingPathComponent("CleanAnalyzeTest.result")

            let xcresult = try XCResult(bundleURL: inputURL)
            let infoPlist = xcresult.infoPlist
            let testSummariesURL = try infoPlist.urlForTestSummary(relativeTo: inputURL)
            let testSummariesPlist = try infoPlist.testSummary(relativeTo: inputURL)

            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let outputData = try encoder.encode(testSummariesPlist)
            let outputURL = FileManager.default
                .temporaryDirectory
                .appendingPathComponent("TestSummaries.\(UUID().uuidString).plist")
            try outputData.write(to: outputURL)
            XCTAssertTrue(try diff(url: testSummariesURL, with: outputURL))
        } catch {
            NSLog("error: \(error)")
            throw error
        }
    }

    static var allTests = [
        ("testCodable", testCodable),
        ]
}

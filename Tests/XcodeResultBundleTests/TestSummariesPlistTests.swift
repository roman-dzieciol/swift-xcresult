import XCTest
@testable import XcodeResultBundle

@available(OSX 10.13, *)
final class TestSummariesPlistTests: XCTestCase {

    func testCodable() throws {
        do {
            let bundleDirURL = try generateResultBundles()

            let inputURL = bundleDirURL.appendingPathComponent("CleanAnalyzeTest.result").appendingPathComponent("Info.plist")
            let inputData = try Data(contentsOf: inputURL)
            let decoder = PropertyListDecoder()
            let infoPlist = try decoder.decode(InfoPlist.self, from: inputData)

            let testSummariesURL = URL(fileURLWithPath: infoPlist.TestSummaryPath!, isDirectory: false).standardized
            let testSummariesData = try Data(contentsOf: testSummariesURL)
            let testSummariesPlist = try decoder.decode(TestSummariesPlist.self, from: testSummariesData)

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

import XCTest
@testable import SWXCResult


final class InfoPlistTests: XCTestCase {

    func testCodable() throws {
        do {
            let bundleDirURL = try generateResultBundles()
            let bundleURL = bundleDirURL.appendingPathComponent("CleanAnalyzeTest.result")
            let xcresult = try XCResult(bundleURL: bundleURL)

            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let outputData = try encoder.encode(xcresult.infoPlist)
            let outputURL = FileManager.default
                .temporaryDirectory
                .appendingPathComponent("Info.\(UUID().uuidString).plist")
            try outputData.write(to: outputURL)
            XCTAssertTrue(try diff(url: xcresult.infoURL, with: outputURL))
        } catch {
            NSLog("error: \(error)")
            throw error
        }
    }

    static var allTests = [
        ("testCodable", testCodable),
    ]
}

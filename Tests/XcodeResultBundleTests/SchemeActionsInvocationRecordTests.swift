import XCTest
@testable import XcodeResultBundle


final class SchemeActionsInvocationRecordTests: XCTestCase {

    func testCodable() throws {
        do {
            let bundleDirURL = try generateResultBundles()
            let inputURL = bundleDirURL.appendingPathComponent("CleanAnalyzeTest.result").appendingPathComponent("Info.plist")
            let inputData = try Data(contentsOf: inputURL)
            let decoder = PropertyListDecoder()
            let infoPlist = try decoder.decode(InfoPlist.self, from: inputData)
            let encoder = PropertyListEncoder()
            encoder.outputFormat = .xml
            let outputData = try encoder.encode(infoPlist)
            let outputURL = FileManager.default
                .temporaryDirectory
                .appendingPathComponent("Info.\(UUID().uuidString).plist")
            try outputData.write(to: outputURL)
            XCTAssertTrue(try diff(url: inputURL, with: outputURL))
        } catch {
            NSLog("error: \(error)")
            throw error
        }
    }

    static var allTests = [
        ("testCodable", testCodable),
    ]
}

import XCTest
@testable import SWXCResult


final class PlistTests: XCTestCase {

    func testCodable() throws {
        do {
            let bundleDirURL = try generateResultBundles()
            let inputURL = bundleDirURL.appendingPathComponent("CleanAnalyzeTest.result")

            let xcresult = try XCResult(bundleURL: inputURL)
            let infoPlist = xcresult.infoPlist
            let infoOutputURL = urlForStoringInTempDir(url: xcresult.infoURL)

            try write(asPlist: infoPlist, url: infoOutputURL)
            XCTAssertTrue(try diff(url: xcresult.infoURL, with: infoOutputURL))

            let testSummariesURL = try infoPlist.urlForTestSummary(relativeTo: inputURL)
            let testSummariesPlist = try infoPlist.testSummary(relativeTo: inputURL)
            let testSummariesOutputURL = urlForStoringInTempDir(url: testSummariesURL)

            try write(asPlist: testSummariesPlist, url: testSummariesOutputURL)
            XCTAssertTrue(try diff(url: testSummariesURL, with: testSummariesOutputURL))

            try xcresult.infoPlist.Actions?.forEach { action in
               try [action.ActionResult, action.BuildResult].compactMap{ $0 }.forEach { result in
                    if let url = result.urlForTestSummary(relativeTo: inputURL) {
                        let summaries = try SchemeActionResultTestSummary.from(contentsOf: url)
                        let outputURL = urlForStoringInTempDir(url: url)
                        try write(asPlist: summaries, url: outputURL)
                        XCTAssertTrue(try diff(url: url, with: outputURL))
                    }
                }
            }
        } catch {
            NSLog("error: \(error)")
            throw error
        }
    }

    func write<T>(asPlist object: T, url: URL) throws where T: Codable {
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        let outputData = try plistEncoder.encode(object)
        try outputData.write(to: url)
    }

    func urlForStoringInTempDir(url: URL) -> URL {
        let ext = url.pathExtension
        let basename = url.deletingPathExtension().lastPathComponent
        return FileManager.default
            .temporaryDirectory
            .appendingPathComponent(basename)
            .appendingPathExtension(UUID().uuidString)
            .appendingPathExtension(ext)
    }

    static var allTests = [
        ("testCodable", testCodable),
    ]
}

import XCTest
@testable import SWXCResult


final class PlistTests: XCTestCase {

    func testCodable() throws {
        do {
            let bundleDirURL = try generateResultBundles()
            let inputURL = bundleDirURL.appendingPathComponent("CleanAnalyzeTest.result")

            let xcresult = try XCResult(bundleURL: inputURL)
            let infoPlist = xcresult.infoPlist
            XCTAssertNotNil(xcresult.infoURL.baseURL)
            let infoOutputURL = urlForStoringInTempDir(url: xcresult.infoURL)

            try write(asPlist: infoPlist, url: infoOutputURL)
            XCTAssertTrue(try diff(url: xcresult.infoURL, with: infoOutputURL))

            let testSummariesURL = infoPlist.urlForTestSummary(relativeTo: inputURL)!
            XCTAssertNotNil(testSummariesURL.baseURL)
            let testSummariesPlist = try infoPlist.testSummary(relativeTo: inputURL)
            let testSummariesOutputURL = urlForStoringInTempDir(url: testSummariesURL)

            try write(asPlist: testSummariesPlist, url: testSummariesOutputURL)
            XCTAssertTrue(try diff(url: testSummariesURL, with: testSummariesOutputURL))

            try xcresult.infoPlist.Actions?.forEach { action in
               try [action.ActionResult, action.BuildResult].compactMap{ $0 }.forEach { result in
                    if let url = result.urlForTestSummary(relativeTo: inputURL) {
                        XCTAssertNotNil(url.baseURL)
                        let summaries = try SchemeActionResultTestSummary.from(contentsOf: url)
                        let outputURL = urlForStoringInTempDir(url: url)
                        try write(asPlist: summaries, url: outputURL)
                        XCTAssertTrue(try diff(url: url, with: outputURL))

                        if let logURL = result.urlForLogPath(relativeTo: bundleDirURL) {
                            XCTAssertNotNil(logURL.baseURL)
                        }

                        if let codeCoverageURL = result.urlForCodeCoveragePath(relativeTo: bundleDirURL) {
                            XCTAssertNotNil(codeCoverageURL.baseURL)
                        }

                        if let codeCoverageArchiveURL = result.urlForCodeCoverageArchivePath(relativeTo: bundleDirURL) {
                            XCTAssertNotNil(codeCoverageArchiveURL.baseURL)
                        }
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

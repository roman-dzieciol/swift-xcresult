//
//  SchemeActionResult.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionResult: Codable {

    public let AnalyzerWarningCount: Int
    public let AnalyzerWarningSummaries: [SchemeActionIssueSummary]?
    public let CodeCoverageArchivePath: String?
    public let CodeCoveragePath: String?
    public let ErrorCount: Int
    public let ErrorSummaries: [SchemeActionIssueSummary]?
    public let HasCodeCoverage: Bool
    public let LogPath: String?
    public let Status: String
    public let TestFailureSummaries: [SchemeActionTestFailureIssueSummary]?
    public let TestSummaryPath: String?
    public let TestsCount: Int
    public let TestsFailedCount: Int
    public let WarningCount: Int
    public let WarningSummaries: [SchemeActionIssueSummary]?

    public init
        ( AnalyzerWarningCount: Int
        , AnalyzerWarningSummaries: [SchemeActionIssueSummary]?
        , CodeCoverageArchivePath: String?
        , CodeCoveragePath: String?
        , ErrorCount: Int
        , ErrorSummaries: [SchemeActionIssueSummary]?
        , HasCodeCoverage: Bool
        , LogPath: String?
        , Status: String
        , TestFailureSummaries: [SchemeActionTestFailureIssueSummary]?
        , TestSummaryPath: String?
        , TestsCount: Int
        , TestsFailedCount: Int
        , WarningCount: Int
        , WarningSummaries: [SchemeActionIssueSummary]?
        ) {
        self.AnalyzerWarningCount = AnalyzerWarningCount
        self.AnalyzerWarningSummaries = AnalyzerWarningSummaries
        self.CodeCoverageArchivePath = CodeCoverageArchivePath
        self.CodeCoveragePath = CodeCoveragePath
        self.ErrorCount = ErrorCount
        self.ErrorSummaries = ErrorSummaries
        self.HasCodeCoverage = HasCodeCoverage
        self.LogPath = LogPath
        self.Status = Status
        self.TestFailureSummaries = TestFailureSummaries
        self.TestSummaryPath = TestSummaryPath
        self.TestsCount = TestsCount
        self.TestsFailedCount = TestsFailedCount
        self.WarningCount = WarningCount
        self.WarningSummaries = WarningSummaries
    }

    public func urlForTestSummary(relativeTo baseURL: URL) -> URL? {
        return TestSummaryPath.flatMap {
            URL(fileURLWithPath: $0, isDirectory: false, relativeTo: baseURL)
        }
    }

    public func urlForLogPath(relativeTo baseURL: URL) -> URL? {
        return LogPath.flatMap {
            URL(fileURLWithPath: $0, isDirectory: false, relativeTo: baseURL)
        }
    }

    public func urlForCodeCoveragePath(relativeTo baseURL: URL) -> URL? {
        return CodeCoveragePath.flatMap {
            URL(fileURLWithPath: $0, isDirectory: false, relativeTo: baseURL)
        } ?? urlForFallbackCodeCoveragePath(relativeTo: baseURL)
    }

    public func urlForCodeCoverageArchivePath(relativeTo baseURL: URL) -> URL? {
        return CodeCoverageArchivePath.flatMap {
            URL(fileURLWithPath: $0, isDirectory: true, relativeTo: baseURL)
        } ?? urlForFallbackCodeCoverageArchivePath(relativeTo: baseURL)
    }
}

extension SchemeActionResult {

    public func urlForResultDir(relativeTo baseURL: URL) -> URL? {
        return urlForLogPath(relativeTo: baseURL)?.deletingLastPathComponent() ??
            urlForTestSummary(relativeTo: baseURL)?.deletingLastPathComponent()
    }

    public func urlForFallbackCodeCoverageArchivePath(relativeTo baseURL: URL) -> URL? {
        if HasCodeCoverage, let resultDirURL = urlForResultDir(relativeTo: baseURL) {
            return URL(fileURLWithPath: resultDirURL.relativePath,
                       isDirectory: true,
                       relativeTo: baseURL).appendingPathComponent("action.xccovarchive")
        }
        return nil
    }

    public func urlForFallbackCodeCoveragePath(relativeTo baseURL: URL) -> URL? {
        if HasCodeCoverage, let resultDirURL = urlForResultDir(relativeTo: baseURL) {
            return URL(fileURLWithPath: resultDirURL.relativePath,
                       isDirectory: false,
                       relativeTo: baseURL).appendingPathComponent("action.xccovreport")
        }
        return nil
    }
}

//
//  SchemeActionsInvocationRecord.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionsInvocationRecord: Codable {

    public let Actions: [SchemeActionRecord]?
    public let AnalyzerWarningCount: Int
    public let AnalyzerWarningSummaries: [SchemeActionIssueSummary]?
    public let ArchivePath: String?
    public let CreatingWorkspaceFilePath: String
    public let ErrorCount: Int
    public let ErrorSummaries: [SchemeActionIssueSummary]?
    public let FormatVersion: String
    public let Running: Bool
    public let SchemeIdentifier: EntityIdentifier?
    public let TestFailureSummaries: [SchemeActionTestFailureIssueSummary]?
    public let TestSummaryIdentifier: String? // remoteTestSummaryIdentifier
    public let TestSummaryPath: String?
    public let TestsCount: Int
    public let TestsFailedCount: Int
    public let WarningCount: Int
    public let WarningSummaries: [SchemeActionIssueSummary]?
    public let archiveGUID: String?

    public init
        ( Actions: [SchemeActionRecord]?
        , AnalyzerWarningCount: Int
        , AnalyzerWarningSummaries: [SchemeActionIssueSummary]?
        , ArchivePath: String?
        , CreatingWorkspaceFilePath: String
        , ErrorCount: Int
        , ErrorSummaries: [SchemeActionIssueSummary]?
        , FormatVersion: String
        , Running: Bool
        , SchemeIdentifier: EntityIdentifier?
        , TestFailureSummaries: [SchemeActionTestFailureIssueSummary]?
        , TestSummaryIdentifier: String?
        , TestSummaryPath: String?
        , TestsCount: Int
        , TestsFailedCount: Int
        , WarningCount: Int
        , WarningSummaries: [SchemeActionIssueSummary]?
        , archiveGUID: String?
        )
    {
        self.Actions = Actions
        self.AnalyzerWarningCount = AnalyzerWarningCount
        self.AnalyzerWarningSummaries = AnalyzerWarningSummaries
        self.ArchivePath = ArchivePath
        self.CreatingWorkspaceFilePath = CreatingWorkspaceFilePath
        self.ErrorCount = ErrorCount
        self.ErrorSummaries = ErrorSummaries
        self.FormatVersion = FormatVersion
        self.Running = Running
        self.SchemeIdentifier = SchemeIdentifier
        self.TestFailureSummaries = TestFailureSummaries
        self.TestSummaryIdentifier = TestSummaryIdentifier
        self.TestSummaryPath = TestSummaryPath
        self.TestsCount = TestsCount
        self.TestsFailedCount = TestsFailedCount
        self.WarningCount = WarningCount
        self.WarningSummaries = WarningSummaries
        self.archiveGUID = archiveGUID
    }

    public func urlForTestSummary(relativeTo baseURL: URL) -> URL? {
        return TestSummaryPath.flatMap {
            let originalURL = URL(fileURLWithPath: $0, isDirectory: false)
            return URL(fileURLWithPath: originalURL.lastPathComponent, isDirectory: false, relativeTo: baseURL)
        }
    }

    public func testSummary(relativeTo baseURL: URL) throws -> TestSummariesPlist? {
        return try urlForTestSummary(relativeTo: baseURL).flatMap {
            return try TestSummariesPlist.from(contentsOf: $0)
        }
    }
}






//
//  SchemeActionTestableSummary.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public final class SchemeActionTestableSummary: Codable {

    public let DiagnosticsDirectory: String
    public let FailureSummaries: [SchemeActionTestFailureSummary]?
    public let ProjectPath: String
    public let TargetName: String
    public let TestKind: String
    public let TestName: String
    public let TestObjectClass: String
    public let Tests: [SchemeActionTestSummaryOrGroup]

    public init
        ( DiagnosticsDirectory: String
        , FailureSummaries: [SchemeActionTestFailureSummary]?
        , ProjectPath: String
        , TargetName: String
        , TestKind: String
        , TestName: String
        , TestObjectClass: String
        , Tests: [SchemeActionTestSummaryOrGroup]
        ) {
        self.DiagnosticsDirectory = DiagnosticsDirectory
        self.FailureSummaries = FailureSummaries
        self.ProjectPath = ProjectPath
        self.TargetName = TargetName
        self.TestKind = TestKind
        self.TestName = TestName
        self.TestObjectClass = TestObjectClass
        self.Tests = Tests
    }
}


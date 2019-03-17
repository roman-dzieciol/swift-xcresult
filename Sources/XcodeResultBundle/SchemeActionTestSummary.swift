//
//  SchemeActionTestSummary.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public final class SchemeActionTestSummary: Codable {

    public let ActivitySummaries: [SchemeActionTestActivitySummary]?
    public let Duration: Double
    public let FailureSummaries: [SchemeActionTestFailureSummary]?
    public let PerformanceMetrics: [SchemeActionTestPerformanceMetricSummary]?
    public let TestIdentifier: String
    public let TestName: String
    public let TestObjectClass: String
    public let TestStatus: String
    public let TestSummaryGUID: String

    public init
        ( ActivitySummaries: [SchemeActionTestActivitySummary]?
        , Duration: Double
        , FailureSummaries: [SchemeActionTestFailureSummary]?
        , PerformanceMetrics:  [SchemeActionTestPerformanceMetricSummary]?
        , TestIdentifier: String
        , TestName: String
        , TestObjectClass: String
        , TestStatus: String
        , TestSummaryGUID: String
        ) {
        self.ActivitySummaries = ActivitySummaries
        self.Duration = Duration
        self.FailureSummaries = FailureSummaries
        self.PerformanceMetrics = PerformanceMetrics
        self.TestIdentifier = TestIdentifier
        self.TestName = TestName
        self.TestObjectClass = TestObjectClass
        self.TestStatus = TestStatus
        self.TestSummaryGUID = TestSummaryGUID
    }

}

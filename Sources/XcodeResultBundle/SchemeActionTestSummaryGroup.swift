//
//  SchemeActionTestSummaryGroup.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public final class SchemeActionTestSummaryGroup: Codable {

    public let Duration: Double
    public let FailureSummaries: [SchemeActionTestFailureSummary]?
    public let Subtests: [SchemeActionTestSummaryOrGroup]
    public let TestIdentifier: String
    public let TestName: String
    public let TestObjectClass: String

    public init
        ( Duration: Double
        , FailureSummaries: [SchemeActionTestFailureSummary]?
        , Subtests: [SchemeActionTestSummaryOrGroup]
        , TestIdentifier: String
        , TestName: String
        , TestObjectClass: String
        ) {
        self.Duration = Duration
        self.FailureSummaries = FailureSummaries
        self.Subtests = Subtests
        self.TestIdentifier = TestIdentifier
        self.TestName = TestName
        self.TestObjectClass = TestObjectClass
    }

}



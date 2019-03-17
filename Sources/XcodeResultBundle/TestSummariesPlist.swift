//
//  TestSummariesPlist.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation


public final class TestSummariesPlist: Codable {
    public let FormatVersion: String
    public let TestableSummaries: [SchemeActionTestableSummary]

    public init
        ( FormatVersion: String
        , TestableSummaries: [SchemeActionTestableSummary]
        ) {
        self.FormatVersion = FormatVersion
        self.TestableSummaries = TestableSummaries
    }
}


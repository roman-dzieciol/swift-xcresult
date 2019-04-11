//
//  TestSummariesPlist.swift
//  SWXCResult
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

    public static func from(contentsOf url: URL) throws -> TestSummariesPlist {
        let inputData = try Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try decoder.decode(TestSummariesPlist.self, from: inputData)
    }
    
}


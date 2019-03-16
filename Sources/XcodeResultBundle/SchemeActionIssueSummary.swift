//
//  SchemeActionIssueSummary.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionIssueSummary: Codable {

    /// DVTDocumentLocation
    public let DocumentLocationData: Data
    public let IssueType: String
    public let Message: String
    public let Target: String

    public init
        ( DocumentLocationData: Data
        , IssueType: String
        , Message: String
        , Target: String
        ) {
        self.DocumentLocationData = DocumentLocationData
        self.IssueType = IssueType
        self.Message = Message
        self.Target = Target
    }
}

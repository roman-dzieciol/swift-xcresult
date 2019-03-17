//
//  SchemeActionTestFailureSummary.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

final public class SchemeActionTestFailureSummary: Codable {

    public let FileName: String
    public let LineNumber: Int
    public let Message: String
    public let PerformanceFailure: Bool

    public init
        ( FileName: String
        , LineNumber: Int
        , Message: String
        , PerformanceFailure: Bool
        ) {
        self.FileName = FileName
        self.LineNumber = LineNumber
        self.Message = Message
        self.PerformanceFailure = PerformanceFailure
    }

}


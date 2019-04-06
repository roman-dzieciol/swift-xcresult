//
//  SchemeActionIssueSummary.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation
import XCActivityLog

public final class DocumentLocation: Codable {

    public let DocumentURLString: String
    public let Timestamp: TimeInterval

    public init
        ( DocumentURLString: String
        , Timestamp: TimeInterval
        ) {
        self.DocumentURLString = DocumentURLString
        self.Timestamp = Timestamp
    }
}

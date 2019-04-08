//
//  SchemeActionRecord.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionRecord: Codable {

    public let ActionResult: SchemeActionResult?
    public let BuildResult: SchemeActionResult?
    public let EndedTime: Date
    public let RunDestination: SchemeActionRunDestinationRecord
    public let SchemeCommand: String
    public let SchemeTask: String
    public let StartedTime: Date
    public let Title: String

    public init
        ( ActionResult: SchemeActionResult?
        , BuildResult: SchemeActionResult?
        , EndedTime: Date
        , RunDestination: SchemeActionRunDestinationRecord
        , SchemeCommand: String
        , SchemeTask: String
        , StartedTime: Date
        , Title: String
        ) {
        self.ActionResult = ActionResult
        self.BuildResult = BuildResult
        self.EndedTime = EndedTime
        self.RunDestination = RunDestination
        self.SchemeCommand = SchemeCommand
        self.SchemeTask = SchemeTask
        self.StartedTime = StartedTime
        self.Title = Title
    }

}

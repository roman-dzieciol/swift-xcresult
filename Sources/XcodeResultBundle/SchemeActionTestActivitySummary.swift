//
//  SchemeActionTestActivitySummary.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public final class SchemeActionTestActivitySummary: Codable {

    public let ActivityType: String
    public let Attachments: [SchemeActionTestAttachment]?
    public let DiagnosticReportFileName: String?
    public let FinishTimeInterval: Double
    public let HasDiagnosticReportData: Bool?
    public let HasMemoryGraphData: Bool?
    public let HasScreenshotData: Bool?
    public let HasSnapshot: Bool?
    public let HasSynthesizedEvent: Bool?
    public let MemoryGraphFileName: String?
    public let StartTimeInterval: Double
    public let SubActivities: [SchemeActionTestActivitySummary]?
    public let Title: String
    public let UUID: String

    public init
        ( ActivityType: String
        , Attachments: [SchemeActionTestAttachment]?
        , DiagnosticReportFileName: String?
        , FinishTimeInterval: Double
        , HasDiagnosticReportData: Bool?
        , HasMemoryGraphData: Bool?
        , HasScreenshotData: Bool?
        , HasSnapshot: Bool?
        , HasSynthesizedEvent: Bool?
        , MemoryGraphFileName: String?
        , StartTimeInterval: Double
        , SubActivities: [SchemeActionTestActivitySummary]?
        , Title: String
        , UUID: String
        ) {
        self.ActivityType = ActivityType
        self.Attachments = Attachments
        self.DiagnosticReportFileName = DiagnosticReportFileName
        self.FinishTimeInterval = FinishTimeInterval
        self.HasDiagnosticReportData = HasDiagnosticReportData
        self.HasMemoryGraphData = HasMemoryGraphData
        self.HasScreenshotData = HasScreenshotData
        self.HasSnapshot = HasSnapshot
        self.HasSynthesizedEvent = HasSynthesizedEvent
        self.MemoryGraphFileName = MemoryGraphFileName
        self.StartTimeInterval = StartTimeInterval
        self.SubActivities = SubActivities
        self.Title = Title
        self.UUID = UUID
    }
}


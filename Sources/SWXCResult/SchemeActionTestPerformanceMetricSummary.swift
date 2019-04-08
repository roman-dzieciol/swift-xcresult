//
//  SchemeActionTestPerformanceMetricSummary.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public final class SchemeActionTestPerformanceMetricSummary: Codable {

    public let BaselineAverage: String?
    public let BaselineName: String?
    public let Identifier: String
    public let MaxPercentRegression: Int
    public let MaxPercentRelativeStandardDeviation: Int
    public let MaxRegression: Double
    public let MaxStandardDeviation: Double
    public let Measurements: [Double]
    public let Name: String
    public let UnitOfMeasurement: String

    public init
        ( BaselineAverage: String?
        , BaselineName: String?
        , Identifier: String
        , MaxPercentRegression: Int
        , MaxPercentRelativeStandardDeviation: Int
        , MaxRegression: Double
        , MaxStandardDeviation: Double
        , Measurements: [Double]
        , Name: String
        , UnitOfMeasurement: String

        ) {
        self.BaselineAverage = BaselineAverage
        self.BaselineName = BaselineName
        self.Identifier = Identifier
        self.MaxPercentRegression = MaxPercentRegression
        self.MaxPercentRelativeStandardDeviation = MaxPercentRelativeStandardDeviation
        self.MaxRegression = MaxRegression
        self.MaxStandardDeviation = MaxStandardDeviation
        self.Measurements = Measurements
        self.Name = Name
        self.UnitOfMeasurement = UnitOfMeasurement

    }
}


/*



 */


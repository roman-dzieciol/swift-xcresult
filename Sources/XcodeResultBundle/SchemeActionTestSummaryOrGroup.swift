//
//  SchemeActionTestSummaryOrGroup.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public enum SchemeActionTestSummaryOrGroup: Codable {

    case summary(SchemeActionTestSummary)
    case group(SchemeActionTestSummaryGroup)

    private enum CodingKeys: CodingKey {
        case TestObjectClass
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let objectClass = try container.decode(String.self, forKey: .TestObjectClass)
        switch objectClass {
        case "IDESchemeActionTestSummary":
            self = .summary(try SchemeActionTestSummary(from: decoder))
        case "IDESchemeActionTestSummaryGroup":
            self = .group(try SchemeActionTestSummaryGroup(from: decoder))
        default:
            throw DecodingError.dataCorruptedError(forKey: CodingKeys.TestObjectClass, in: container, debugDescription: "Unknown TestObjectClass \(objectClass)")
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .summary(summary):
            try container.encode(summary)
        case let .group(group):
            try container.encode(group)
        }
    }
}

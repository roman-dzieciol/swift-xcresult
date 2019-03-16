//
//  SchemeActionPlatformRecord.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionPlatformRecord: Codable {

    public let Identifier: String
    public let Name: String

    public init
        ( Identifier: String
        , Name: String
        ) {
        self.Identifier = Identifier
        self.Name = Name
    }
}

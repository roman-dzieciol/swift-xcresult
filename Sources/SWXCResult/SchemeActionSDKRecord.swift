//
//  SchemeActionSDKRecord.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionSDKRecord: Codable {

    public let Identifier: String
    public let IsInternal: Bool
    public let Name: String
    public let OperatingSystemVersion: String

    public init
        ( Identifier: String
        , IsInternal: Bool
        , Name: String
        , OperatingSystemVersion: String
        ) {
        self.Identifier = Identifier
        self.IsInternal = IsInternal
        self.Name = Name
        self.OperatingSystemVersion = OperatingSystemVersion
    }
}

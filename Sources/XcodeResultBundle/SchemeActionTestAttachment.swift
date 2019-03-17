//
//  SchemeActionTestAttachment.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/17/19.
//

import Foundation

public final class SchemeActionTestAttachment: Codable {

    public let Filename: String
    public let HasPayload: Bool
    public let InActivityIdentifier: Int
    public let Lifetime: Int
    public let Name: String
    public let Timestamp: Double
    public let UniformTypeIdentifier: String

    public init
        ( Filename: String
        , HasPayload: Bool
        , InActivityIdentifier: Int
        , Lifetime: Int
        , Name: String
        , Timestamp: Double
        , UniformTypeIdentifier: String
        ) {
        self.Filename = Filename
        self.HasPayload = HasPayload
        self.InActivityIdentifier = InActivityIdentifier
        self.Lifetime = Lifetime
        self.Name = Name
        self.Timestamp = Timestamp
        self.UniformTypeIdentifier = UniformTypeIdentifier
    }
}



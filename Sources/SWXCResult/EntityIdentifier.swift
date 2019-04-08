//
//  EntityIdentifier.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 4/1/19.
//

import Foundation


public final class EntityIdentifier: Codable {
    public let ContainerName: String
    public let EntityName: String
    public let EntityType: String
    public let SharedState: String

    public init
        ( ContainerName: String
        , EntityName: String
        , EntityType: String
        , SharedState: String
        ) {
        self.ContainerName = ContainerName
        self.EntityName = EntityName
        self.EntityType = EntityType
        self.SharedState = SharedState

    }
}


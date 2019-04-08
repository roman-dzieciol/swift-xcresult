//
//  RunDestinationRecord.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionRunDestinationRecord: Codable {

    public let LocalComputer: SchemeActionDeviceRecord
    public let Name: String
    public let TargetArchitecture: String
    public let TargetDevice: SchemeActionDeviceRecord
    public let TargetSDK: SchemeActionSDKRecord

    public init
        ( LocalComputer: SchemeActionDeviceRecord
        , Name: String
        , TargetArchitecture: String
        , TargetDevice: SchemeActionDeviceRecord
        , TargetSDK: SchemeActionSDKRecord
        ) {
        self.LocalComputer = LocalComputer
        self.Name = Name
        self.TargetArchitecture = TargetArchitecture
        self.TargetDevice = TargetDevice
        self.TargetSDK = TargetSDK
    }
}

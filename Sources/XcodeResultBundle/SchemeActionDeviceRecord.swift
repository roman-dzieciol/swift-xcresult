//
//  SchemeActionDeviceRecord.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/16/19.
//

import Foundation

public final class SchemeActionDeviceRecord: Codable {

    public let Name: String
    public let Identifier: String
    public let IsConcreteDevice: Bool
    public let ModelCode: String
    public let ModelName: String
    public let ModelUTI: String
    public let NativeArchitecture: String
    public let OperatingSystemVersion: String
    public let OperatingSystemVersionWithBuildNumber: String
    public let CPUKind: String?
    public let CPUCount: Int?
    public let CPUSpeedInMHz: Int?
    public let BusSpeedInMHz: Int?
    public let RAMSizeInMegabytes: Int?
    public let PhysicalCPUCoresPerPackage: Int?
    public let LogicalCPUCoresPerPackage: Int?
    public let Platform: SchemeActionPlatformRecord

    public init
        ( Name: String
        , Identifier: String
        , IsConcreteDevice: Bool
        , ModelCode: String
        , ModelName: String
        , ModelUTI: String
        , NativeArchitecture: String
        , OperatingSystemVersion: String
        , OperatingSystemVersionWithBuildNumber: String
        , CPUKind: String?
        , CPUCount: Int?
        , CPUSpeedInMHz: Int?
        , BusSpeedInMHz: Int?
        , RAMSizeInMegabytes: Int?
        , PhysicalCPUCoresPerPackage: Int?
        , LogicalCPUCoresPerPackage: Int?
        , Platform: SchemeActionPlatformRecord
        ) {
        self.Name = Name
        self.Identifier = Identifier
        self.IsConcreteDevice = IsConcreteDevice
        self.ModelCode = ModelCode
        self.ModelName = ModelName
        self.ModelUTI = ModelUTI
        self.NativeArchitecture = NativeArchitecture
        self.OperatingSystemVersion = OperatingSystemVersion
        self.OperatingSystemVersionWithBuildNumber = OperatingSystemVersionWithBuildNumber
        self.CPUKind = CPUKind
        self.CPUCount = CPUCount
        self.CPUSpeedInMHz = CPUSpeedInMHz
        self.BusSpeedInMHz = BusSpeedInMHz
        self.RAMSizeInMegabytes = RAMSizeInMegabytes
        self.PhysicalCPUCoresPerPackage = PhysicalCPUCoresPerPackage
        self.LogicalCPUCoresPerPackage = LogicalCPUCoresPerPackage
        self.Platform = Platform
    }
}

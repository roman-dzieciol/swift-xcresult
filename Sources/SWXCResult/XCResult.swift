//
//  XCResult.swift
//  SWXCResult
//
//  Created by Roman Dzieciol on 4/8/19.
//

import Foundation

public final class XCResult {

    public let bundleURL: URL

    public let infoURL: URL

    public let infoPlist: InfoPlist

    public init(bundleURL: URL) throws {
        self.bundleURL = bundleURL
        infoURL = bundleURL.appendingPathComponent("Info.plist")

        let inputData = try Data(contentsOf: infoURL)
        let decoder = PropertyListDecoder()
        infoPlist = try decoder.decode(InfoPlist.self, from: inputData)
    }
}

//
//  XCTestCase+Resources.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/16/19.
//

import XCTest

@available(OSX 10.13, *)
extension XCTestCase {

    public func diff(url: URL, with otherURL: URL) throws -> Bool {
        let process = Process()
        process.launchPath = "/usr/bin/env"
        process.arguments = [
            "diff",
            url.standardized.path,
            otherURL.standardized.path
        ]
        try process.run()
        process.waitUntilExit()
        return process.terminationStatus == EXIT_SUCCESS
    }
}

public func urlForResource(named name: String) -> URL {
    return URL(fileURLWithPath: #file, isDirectory: false)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .appendingPathComponent(name)
}

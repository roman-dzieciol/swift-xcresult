//
//  XCTestCase+Resources.swift
//  XcodeResultBundle
//
//  Created by Roman Dzieciol on 3/16/19.
//

import XCTest


extension XCTestCase {

    func generateResultBundles() throws -> URL {

        let bundleDirURL = urlForBundleDir()

        let process = Process()
        process.launchPath = "/usr/bin/env"
        process.currentDirectoryURL = urlForSourceRoot().appendingPathComponent("iOSResultBundleApp")
        process.arguments = [
            "bash",
            "./generateResultBundles.sh",
            "\(bundleDirURL.path)"
        ]
        try process.run()
        process.waitUntilExit()
        return bundleDirURL
    }


    public func diff(url: URL, with otherURL: URL) throws -> Bool {
        let process = Process()
        process.launchPath = "/usr/bin/env"
        process.arguments = [
            "git",
            "--no-pager",
            "diff",
            url.standardized.path,
            otherURL.standardized.path
        ]
        try process.run()
        process.waitUntilExit()
        return process.terminationStatus == EXIT_SUCCESS
    }
}

public func urlForSourceRoot() -> URL {
    return URL(fileURLWithPath: #file, isDirectory: false)
        .deletingLastPathComponent()
        .deletingLastPathComponent()
        .deletingLastPathComponent()
}


public func urlForBundleDir() -> URL {
    return Bundle.init(for: TestSummariesPlistTests.self).bundleURL.standardized.deletingLastPathComponent()
}

public func urlForResource(named name: String) -> URL {
    return urlForSourceRoot()
        .appendingPathComponent(name)
}

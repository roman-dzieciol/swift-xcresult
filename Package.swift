// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

private struct SWXCResult {
    static let name = "SWXCResult"
}

let package = Package(
    name: SWXCResult.name,
    platforms: [
        .macOS(.v10_14),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: SWXCResult.name,
            targets: [SWXCResult.name]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "git@github.com:roman-dzieciol/swift-xcactivitylog.git", from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: SWXCResult.name,
            dependencies: ["SWXCActivityLog"]),
        .testTarget(
            name: SWXCResult.name + "Tests",
            dependencies: [.target(name: SWXCResult.name)]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

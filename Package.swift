// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VersionKit",
    platforms: [
        .macOS(.v10_12),
        .iOS(.v8),
        .tvOS(.v10),
        .watchOS(.v3)
    ],
    products: [
        .library(
            name: "VersionKit",
            targets: ["VersionKit"]),
    ],
    targets: [
        .target(
            name: "VersionKit",
            path: "Source",
            exclude: ["VersionKit.m"]
        ),
        .testTarget(
            name: "VersionKitTests",
            dependencies: ["VersionKit"],
            path: "Tests",
            exclude: ["VersionKit.m"]
        )
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

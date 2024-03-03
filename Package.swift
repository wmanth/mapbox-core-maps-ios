// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "11.2.0-1"
let checksum = "61c2d199da4bd74dd1d9cbb88d67f2d6d47d400415a99eef6b0e61012f5ab4cf"

let package = Package(
    name: "MapboxCoreMaps",
    platforms: [.iOS(.v10), .macOS(.v10_15), .custom("visionos", versionString: "1.0")],
    products: [
        .library(
            name: "MapboxCoreMaps",
            targets: ["MapboxCoreMapsWrapper"]),
    ],
    dependencies: [
        .package(name: "MapboxCommon", url: "https://github.com/wmanth/mapbox-common-ios.git", from: "24.2.0-1"),
    ],
    targets: [
        .target(
            name: "MapboxCoreMapsWrapper",
            dependencies: ["MapboxCommon", "MapboxCoreMaps"]
        ),
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://mapbox.wmanth.net/packages/MapboxCoreMaps-\(version).zip",
            checksum: checksum
        )
    ]
)

// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "idd-zstd-swift",
    platforms: [
        .iOS(.v15),
        .macOS(.v11)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ZSTDSwift",
            targets: ["ZSTDLib", "ZSTDSwift"]),
    ],
    dependencies: [],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "ZSTDLib",
            dependencies: [],
            path: "Sources/ZSTDLib",
            exclude: ["../ZSTDLib/zstdlib/LICENSE"],
            cxxSettings: [
                .headerSearchPath("../ZSTDLib/"),
            ]
        ),
        .target(
            name: "ZSTDSwift",
            dependencies: ["ZSTDLib"],
            path: "Sources/ZSTDSwift"
        ),
        .testTarget(
            name: "ZSTDSwiftTests",
            dependencies: ["ZSTDSwift", "ZSTDLib"]
        ),
    ]
)

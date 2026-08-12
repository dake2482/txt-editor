// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "TxtEditor",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .library(name: "TxtCore", targets: ["TxtCore"]),
        .executable(name: "BlackBoxTest", targets: ["BlackBoxTest"])
    ],
    targets: [
        .target(name: "TxtCore"),
        .executableTarget(
            name: "BlackBoxTest",
            dependencies: ["TxtCore"]
        )
    ]
)

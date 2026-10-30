// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-leetcode",
    platforms: [.macOS(.v27), .iOS(.v27)],
    products: [
        .library(
            name: "LeetCode",
            targets: ["LeetCode"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/coenttb/swift-testing-performance.git", branch: "main"),
    ],
    targets: [
        .target(
            name: "LeetCode",
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ]
        ),
        .testTarget(
            name: "LeetCodeTests",
            dependencies: [
                "LeetCode",
                .product(name: "TestingPerformance", package: "swift-testing-performance"),
            ],
            swiftSettings: [
                .enableUpcomingFeature("ApproachableConcurrency"),
            ]
        ),
    ]
)

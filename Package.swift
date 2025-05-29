// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "IAP-iOS",
    products: [
        .library(
            name: "IAP-iOS",
            targets: ["IAP-iOS"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick.git", from: "7.0.0"),
        .package(url: "https://github.com/Quick/Nimble.git", from: "13.0.0"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveCocoa.git", branch: "master"),
        .package(url: "https://github.com/Nickelfox/FLUtilities.git", branch: "master"),
        .package(url: "https://github.com/realm/realm-cocoa", from: "10.40.0"),
        .package(url: "https://github.com/Nickelfox/FoxAPIKit.git", branch: "develop"),
        .package(url: "https://github.com/ReactiveCocoa/ReactiveSwift.git", branch: "master"),
        

    ],
    targets: [
        .target(
            name: "IAP-iOS",
            dependencies: [
                "ReactiveCocoa",
                "ReactiveSwift",
                "FLUtilities",
                "FoxAPIKit",
              
                .product(name: "RealmSwift", package: "realm-cocoa"),
            ],
            path: "Sources/IAP-iOS"
        ),
        .testTarget(
            name: "IAP-iOSTests",
            dependencies: [
                "IAP-iOS",
                "FoxAPIKit",
                "Quick",
                "Nimble",
            ]
        ),
    ]
)

// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TAKUUID",
    defaultLocalization: "en",
    products: [
        .library(
            name: "TAKUUID",
            targets: ["TAKUUID"]),
    ],
    targets: [
        .target(
            name: "TAKUUID",
            path: "Classes",
            publicHeadersPath: "."
        ),
        // FIXME: SwiftPM cannot access keychain. Try with xcodeproj.
//        .testTarget(
//            name: "TAKUUIDTests",
//            dependencies: ["TAKUUID"],
//            path: "TAKUUIDTests",
//        ),
    ]
)

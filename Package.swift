// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SnackBar",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "SnackBar",
                 targets: ["SnackBar"]),
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.0.0"))
    ],
    targets: [
        .target(name: "SnackBar",
                dependencies: ["SnapKit"],
                path: "SnackBar.swift"),
    ],
    swiftLanguageVersions: [.v5]

)

// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkingExtension",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "NetworkingExtension",
            targets: ["NetworkingExtension"]
        ),
    ],
    dependencies: [.package(url: "https://github.com/Alamofire/Alamofire", .upToNextMajor(from: "5.8.1"))],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "NetworkingExtension",
            dependencies: ["Alamofire"]
        ),
        .testTarget(
            name: "NetworkingExtensionTests",
            dependencies: ["NetworkingExtension"]
        ),
    ]
)

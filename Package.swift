// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlertPopUp-iOS13",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "AlertPopUp-iOS13",
            targets: ["AlertPopUp-iOS13"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AlertPopUp-iOS13",
            dependencies: []),
        .testTarget(
            name: "AlertPopUp-iOS13Tests",
            dependencies: ["AlertPopUp-iOS13"]),
    ]
)

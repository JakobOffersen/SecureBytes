// swift-tools-version:5.3
import PackageDescription


let package = Package(
    name: "SecureBytes",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "SecureBytes",
            targets: ["SecureBytes"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .binaryTarget(name: "Clibsodium", path: "Clibsodium.xcframework"),
        .target(
            name: "SecureBytes",
            dependencies: ["Clibsodium"]),
        .testTarget(
            name: "SecureBytesTests",
            dependencies: ["SecureBytes"]),
    ]
)

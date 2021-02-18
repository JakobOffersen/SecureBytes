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
        .package(name: "Clibsodium", url: "https://github.com/JakobOffersen/Clibsodium-wrapper.git", .branch("main"))
    ],
    targets: [
        .target(
            name: "SecureBytes",
            dependencies: ["Clibsodium"]),
        .testTarget(
            name: "SecureBytesTests",
            dependencies: ["SecureBytes"]),
    ]
)

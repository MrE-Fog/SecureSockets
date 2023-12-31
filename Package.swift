// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SecureSockets",
    platforms: [.macOS(.v10_10), .iOS(.v8)],
    products: [
        .library(name: "SecureSockets", targets: ["SecureSockets"]),
        .library(name: "Copenssl", targets: ["Copenssl"]),
        .library(name: "CopensslGlue", targets: ["CopensslGlue"])
    ],
    dependencies: [
        .package(url: "https://github.com/Balancingrock/SwifterSockets", from: "1.1.1")
    ],
    targets: [
        .systemLibrary(name: "Copenssl"),
        .target(name: "CopensslGlue"),
        .target(
            name: "SecureSockets",
            dependencies: ["SwifterSockets", "Copenssl", "CopensslGlue"]
            //
            // When building SecureSockets as stand alone, select one of the following
            // Note: The comma in front is necessary!
            //
            // For macOS
            //, swiftSettings: [.unsafeFlags(["-Iopenssl/v1_1_1g-macos_10_15/include"])]
            //
            // For Linux (Mint 19.3)
            //, swiftSettings: [.unsafeFlags(["-Iopenssl/v1_1_1g-mint_19_3/include"])]
        )
    ],
    swiftLanguageVersions: [.v4, .v4_2, .v5]
)

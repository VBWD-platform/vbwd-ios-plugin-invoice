// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "VBWDInvoicePaymentPlugin",
    platforms: [
        .iOS(.v16),
        .macOS(.v13),
    ],
    products: [
        .library(name: "InvoicePaymentPlugin", targets: ["InvoicePaymentPlugin"]),
    ],
    dependencies: [
        .package(path: "../vbwd-ios-core"),
    ],
    targets: [
        .target(
            name: "InvoicePaymentPlugin",
            dependencies: [
                .product(name: "VBWDCore", package: "vbwd-ios-core"),
            ],
            path: "Sources/InvoicePaymentPlugin",
            swiftSettings: [
                .enableUpcomingFeature("StrictConcurrency")
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init([
        
    ], baseSettings: .settings(
        base: [
            "IPHONEOS_DEPLOYMENT_TARGET": "15.0",
            "SWIFT_VERSION": "5.9"
        ],
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release"),
        ]
    )),
    platforms: [.iOS]
)

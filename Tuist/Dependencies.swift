import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: .init([
        .remote(
            url: "https://github.com/gnejfejf2/ReducerKit",
            requirement: .branch("main")
        )
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

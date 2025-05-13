import ProjectDescription
import ProjectDescriptionHelpers
// Creates our project using a helper function defined in ProjectDescriptionHelpers

let project = Project.app(
    name: MainAppName,
    resources: [
        "Projects/\(MainAppName)/Resources/**"
    ],
    packages: [],
    dependencies: [
        .shared(target: .LocalDB, type: .adapters),
        .shared(target: .Network, type: .adapters),
        .core(target: .CoreService, type: .kit),
        .entity(target: .EnvyEntities, type: .interface)
    ]
    + ModulePaths.Feature.allCases
        .filter { $0 != .FeatureBase && $0 != .SampleAppHelper }
        .map { .feature(target: $0, type: .feature) },
    infoPlist: "Projects/\(MainAppName)/Info.plist"
)


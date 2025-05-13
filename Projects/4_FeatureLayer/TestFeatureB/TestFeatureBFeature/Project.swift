import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Feature.TestFeatureB.targetName(type: .feature),
                             moduleTargets: [
                                .staticLibrary,
                                .testSourceModule,
                                .demoApp,
                                .unitTest
                             ],
                             dependencies: [
                                .feature(target: .TestFeatureB, type: .interface)
                             ],
                             demoAppDependencies: [
                                .feature(target: .SampleAppHelper, type: .feature)
                             ])

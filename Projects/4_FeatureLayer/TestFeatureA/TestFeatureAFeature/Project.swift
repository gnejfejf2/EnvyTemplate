import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Feature.TestFeatureA.targetName(type: .feature),
                             moduleTargets: [
                                .staticLibrary,
                                .testSourceModule,
                                .demoApp,
                                .unitTest
                             ],
                             dependencies: [
                                .feature(target: .TestFeatureA, type: .interface)
                             ],
                             demoAppDependencies: [
                                .feature(target: .SampleAppHelper, type: .feature)
                             ])

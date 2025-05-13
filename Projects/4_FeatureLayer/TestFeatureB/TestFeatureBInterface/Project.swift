import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Feature.TestFeatureB.targetName(type: .interface),
                             moduleTargets: [
                                .staticLibrary,
//                                .testSourceModule,
//                                .demoApp,
//                                .unitTest
                             ],
                             dependencies: [
                                .feature(target: .FeatureBase, type: .kit)
                             ])

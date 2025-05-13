import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Feature.SampleAppHelper.targetName(type: .interface),
                             moduleTargets: [
                                .dynamicFramework,
//                                .testSourceModule,
//                                .demoApp,
//                                .unitTest
                             ],
                             dependencies: [
                                .feature(target: .FeatureBase, type: .kit)
                             ])

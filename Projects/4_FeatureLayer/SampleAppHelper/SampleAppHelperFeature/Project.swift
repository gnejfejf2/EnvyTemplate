import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Feature.SampleAppHelper.targetName(type: .feature),
                             moduleTargets: [
                                .staticLibrary,
                                .testSourceModule,
                                .demoApp,
                                .unitTest
                             ],
                             dependencies: [
                                .feature(target: .SampleAppHelper, type: .interface),
                             ],
                             demoAppDependencies: [
                             
                             ])

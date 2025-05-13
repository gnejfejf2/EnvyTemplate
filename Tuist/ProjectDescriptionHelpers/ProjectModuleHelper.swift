//
// ProjectModuleHelper.swift
// ProjectDescriptionHelpers
//
// Created by Envy on 06/02/2023.
//

import ProjectDescription

extension Project {
    
    /// - Parameters:
    ///  - name: 모듈이름
    ///  - moduleTargets:     해당모듈을 만들때 같이 만들어지는 모듈들의 종류들
    ///  - packages:        여기어때 프로젝트에 SPM을 직접 셋팅할 경우 추가할 패키지 값
    ///  - resources:       리소스 경로
    ///  - headers:        해더파일 경로
    ///  - dependencies:      해당모듈이 의존하고있는 모듈
    ///  - infoPlist:       infoPlist에 추가가 필요한 값
    ///  - buildSetting:      빌드셋팅에 추가가 필요한 값
    ///  - unitTestDependencies:  unitTest를 진행할때 추가로 의존해야하는 값
    ///  - demoAppName:      데모앱의 이름 없으면 기본이름사용
    ///  - demoAppSetting:     데모앱에서만 추가해줄 셋팅값
    ///  - demoAppResources:    데모앱에 리소스가 필요할경우 추가해주는 값
    ///  - demoAppDependencies:  데모앱에서만 의존성이 필요한 모듈에대한 값
    public static func module(
        name: String,
        moduleTargets: Set<ModuleTarget>,
        packages: [Package] = [],
        resources: ResourceFileElements? = nil,
        headers: Headers? = nil,
        dependencies: [TargetDependency] = [],
        infoPlist: [String: InfoPlist.Value] = [:],
        buildSetting: SettingsDictionary = [:],
        unitTestDependencies: [TargetDependency] = [],
        demoAppName: String? = nil,
        demoAppSetting: SettingsDictionary = [:],
        demoAppDependencies: [TargetDependency] = []
    ) -> Project {
        let containDynamicFramework = moduleTargets.contains(.dynamicFramework)
        let product: Product = containDynamicFramework ? .framework : .staticLibrary
        var targets: [Target] = []
        var mainModuleBuildSetting = buildSetting
        if containDynamicFramework {
            //다이나믹프레임워크인경우 하위모듈의 ObjC 코드를 읽어올수 없는 이슈가 생길수도있기때문에
            //OtherLinkerFlag에서 ObjC 키워드값을 추가해야함
            mainModuleBuildSetting.updateValue("$(inherited) -ObjC", forKey: "OTHER_LDFLAGS")
        }
        mainModuleBuildSetting.updateValue("5.9.0", forKey: "SWIFT_VERSION")
        let mainModule = getMainModuleTarget(name: name,
                                             product: product,
                                             infoPlist: infoPlist,
                                             buildSetting: mainModuleBuildSetting,
                                             resources: resources,
                                             headers: headers,
                                             dependencies: dependencies)
        
        targets.append(mainModule)
        
        
        if moduleTargets.contains(.testSourceModule) {
            let unitTestSourcesModuleTarget = getTestSourcesModuleTarget(name: name)
            targets.append(unitTestSourcesModuleTarget)
        }
        
        if moduleTargets.contains(.demoApp) {
            let demoAppTarget = getDemoAppModuleTarget(name: name,
                                                       moduleTargets: moduleTargets,
                                                       demoAppName: demoAppName,
                                                       demoAppSetting: demoAppSetting,
                                                       demoAppDependencies: demoAppDependencies)
            targets.append(demoAppTarget)
        }
        
        
        if moduleTargets.contains(.unitTest) {
            let unitTestModuleTarget = getUnitTestModuleTarget(name: name,
                                                               moduleTargets: moduleTargets,
                                                               unitTestDependencies: unitTestDependencies)
            targets.append(unitTestModuleTarget)
        }
        
        return Project(
            name: name,
            packages: packages ,
            settings: .settings(base: ["SWIFT_VERSION":"5.9.0"],
                                configurations: [
                                    .debug(name: "Debug"),
                                    .release(name: "Release")
                                ]),
            targets: targets,
            resourceSynthesizers: []
        )
    }
    
    private static func getMainModuleTarget(name: String,
                                            product: Product,
                                            infoPlist: [String: InfoPlist.Value],
                                            buildSetting: [String: SettingValue],
                                            resources: ResourceFileElements?,
                                            headers: Headers?,
                                            dependencies: [TargetDependency]) -> Target {
        
        return Target(
            name: name,
            platform: MainPlatform,
            product: product,
            bundleId: MainBundleId + "\(name.lowercased())",
            deploymentTarget: MainDeploymentTarget,
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["Sources/**"],
            resources: resources,
            headers: headers,
            dependencies: dependencies,
            settings: .settings(base: buildSetting,
                                configurations: [
                                    .debug(name: "Debug"),
                                    .release(name: "Release")
                                ])
        )
    }
    
    private static func getTestSourcesModuleTarget(name: String) -> Target {
        return Target(
            name: ModuleTarget.testSourceModule.getTargetName(name: name),
            platform: MainPlatform,
            product: .framework,
            bundleId: MainBundleId + "\(name.lowercased())UnitTestSources",
            deploymentTarget: MainDeploymentTarget,
            infoPlist: .default,
            sources: "TestFolder/UnitTestSources/Sources/**",
            resources: "TestFolder/UnitTestSources/Resources/**",
            dependencies: [
                .target(name: "\(name)"),
                .entity(target: .EnvyEntities, type: .interface)
            ],
            settings: .settings(base: ["SWIFT_VERSION":"5.9.0",
                                       "OTHER_LDFLAGS":"$(inherited) -ObjC"],
                                configurations: [
                                    .debug(name: "Debug"),
                                    .release(name: "Release")
                                ])
        )
    }
    
    private static func getDemoAppModuleTarget(name: String,
                                               moduleTargets: Set<ModuleTarget>,
                                               demoAppName: String?,
                                               demoAppSetting: SettingsDictionary,
                                               demoAppDependencies: [TargetDependency]) -> Target {
        
        /// Framework의 Mach-O가 Static 또는 Dynamic인지에 따라 코드 복사 또는 링킹이 발생하여 상황에 맞게 의존관계를 추가해야함.
        /// mainModule이 DynamicFramework이고 추가 UnitTestSourceModule이 있을경우 둘다 다이나믹이라 unitTestSourceModule 추가
        let deps: [TargetDependency]
        let moduleHasDynamicFramework = moduleTargets.contains(.dynamicFramework)
        let moduleHasUnitTestSourceModule = moduleTargets.contains(.testSourceModule)
        var updateDemoAppSetting = demoAppSetting
        updateDemoAppSetting.updateValue("5.9.0", forKey: "SWIFT_VERSION")
        switch (moduleHasDynamicFramework, moduleHasUnitTestSourceModule) {
        case (true, true): deps = [
            .target(name: name),
            .target(name: ModuleTarget.testSourceModule.getTargetName(name: name))
        ]
        case (false, true): deps = [
            .target(name: ModuleTarget.testSourceModule.getTargetName(name: name))
        ]
        case (_, false): deps = [.target(name: name)]
        }
        
        let demoAppTarget = Target(
            name: ModuleTarget.demoApp.getTargetName(name: name),
            platform: MainPlatform,
            product: .app,
            bundleId: setDemoAppIdentifier(name: name, demoAppName: demoAppName),
            deploymentTarget: MainDeploymentTarget,
            infoPlist: getDemoAppInfoPlist(name: name,
                                           demoAppName: demoAppName),
            sources: ["TestFolder/DemoApp/Sources/**"],
            resources: getDemoAppResources(),
            dependencies: demoAppDependencies + deps,
            settings: .settings(base: updateDemoAppSetting,
                                configurations: [
                                    .debug(name: "Debug"),
                                    .release(name: "Release")
                                ])
        )
        
        return demoAppTarget
    }
    
    private static func getUnitTestModuleTarget(name: String,
                                                moduleTargets: Set<ModuleTarget>,
                                                unitTestDependencies: [ProjectDescription.TargetDependency]) -> Target {
        
        /// Framework의 Mach-O가 Static 또는 Dynamic인지에 따라 코드 복사 또는 링킹이 발생하여 상황에 맞게 의존관계를 추가해야함.
        let deps: [TargetDependency]
        let hasDynamicFramework = moduleTargets.contains(.dynamicFramework)
        let hasTestSourceModule = moduleTargets.contains(.testSourceModule)
        let hasDemoApp     = moduleTargets.contains(.demoApp)
        
        
        switch (hasDynamicFramework,
                hasTestSourceModule,
                hasDemoApp) {
        case (true, true, true):
            deps = [
                .target(name: name),
                .target(name: ModuleTarget.testSourceModule.getTargetName(name: name)),
                .target(name: ModuleTarget.demoApp.getTargetName(name: name))
            ]
        case (true, true, false):
            deps = [
                .target(name: name),
                .target(name: ModuleTarget.testSourceModule.getTargetName(name: name))
            ]
        case (true, false, true):
            deps = [
                .target(name: name),
                .target(name: ModuleTarget.demoApp.getTargetName(name: name))
            ]
        case (false, true, true):
            deps = [
                .target(name: ModuleTarget.testSourceModule.getTargetName(name: name)),
                .target(name: ModuleTarget.demoApp.getTargetName(name: name))
            ]
        case (false, true, false):
            deps = [
                .target(name: ModuleTarget.testSourceModule.getTargetName(name: name))
            ]
        case (false, false, true):
            deps = [
                .target(name: ModuleTarget.demoApp.getTargetName(name: name))
            ]
        case (true, false, false), (false, false, false):
            deps = [
                .target(name: name)
            ]
        }
        
        
        return Target(
            name: ModuleTarget.unitTest.getTargetName(name: name),
            platform: MainPlatform,
            product: .unitTests,
            bundleId: MainBundleId + "\(name.lowercased())Tests",
            deploymentTarget: MainDeploymentTarget,
            infoPlist: .default,
            sources: "TestFolder/Test/Sources/**",
            resources: "TestFolder/Test/Resources/**",
            dependencies: [
                .xctest
            ] + unitTestDependencies + deps,
            settings: .settings(base: ["SWIFT_VERSION":"5.9.0"],
                                configurations: [
                                    .debug(name: "Debug"),
                                    .release(name: "Release")
                                ])
        )
    }
    
    private static func getDemoAppResources() -> ResourceFileElements {
        var demoAppResourcesList = ResourceFileElements(resources: [
            .glob(pattern: .relativeToRoot("Projects/\(MainAppName)/Resources/**"))
        ])
        
        demoAppResourcesList = ResourceFileElements(resources: [
            .glob(pattern: .relativeToRoot("Projects/\(MainAppName)/Resources/**")),
            .glob(pattern: .relativeToManifest("TestFolder/DemoApp/Resources/**"))
        ])
        return demoAppResourcesList
    }
    
    private static func getDemoAppInfoPlist(name: String,
                                            demoAppName: String?) -> InfoPlist {
        
        var demoAppInfoPlist: [String : InfoPlist.Value] = [:]
        demoAppInfoPlist.updateValue(.string(demoAppName ?? "\(name)DemoApp"), forKey: "CFBundleName")
        demoAppInfoPlist.updateValue("LaunchScreen",              forKey: "UILaunchStoryboardName")
        demoAppInfoPlist.updateValue(["NSAllowsArbitraryLoads": true],     forKey: "NSAppTransportSecurity")
        demoAppInfoPlist.updateValue(.boolean(false),             forKey: "ITSAppUsesNonExemptEncryption")
        demoAppInfoPlist.updateValue("1", forKey: "CFBundleShortVersionString")
        demoAppInfoPlist.updateValue("1",  forKey: "CFBundleVersion")

        return .extendingDefault(with: demoAppInfoPlist)
    }
    
    private static func setDemoAppTargetName(name: String, demoAppTargetName: String?) -> String {
        if let demoAppTargetName = demoAppTargetName, demoAppTargetName.isEmpty == false {
            return demoAppTargetName
        } else {
            return name + "DemoApp"
        }
    }
    
    private static func setDemoAppIdentifier(name: String, demoAppName: String?) -> String {
        if let demoAppName = demoAppName, demoAppName.isEmpty == false {
            return MainBundleId + demoAppName.lowercased()
        } else {
            return MainBundleId + "\(name.lowercased())DemoApp"
        }
    }
    
}

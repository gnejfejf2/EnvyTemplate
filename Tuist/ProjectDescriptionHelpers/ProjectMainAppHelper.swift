import ProjectDescription

extension Project {
    /// 여기어때 메인 프로젝트를 만들때 사용하는 함수
    /// - Parameters:
    ///   - name: 프로젝트 이름
    ///   - platform: 플랫폼 / 기본 iOS
    ///   - resources: 리소스를 참조할 경로
    ///   - packages: 프로젝트에 SPM을 직접 셋팅할 경우 추가할 패키지 값
    ///   - actions: build phase script 추가
    ///   - modules: 모듈
    ///   - dependencies: MainAppDependencies
    ///   - infoPlist: infoplist 경로
    public static func app(
        name: String,
        platform: Platform = MainPlatform,
        resources: ResourceFileElements? = nil,
        packages: [Package] = [],
        actions: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        infoPlist: InfoPlist
    ) -> Project {
        return projectApp(
            name: name,
            product: .app,
            platform: platform,
            resources: resources,
            packages: packages,
            actions: actions,
            dependencies: dependencies,
            settings: buildSettings(name: name),
            infoPlist: infoPlist
        )
    }
    
    
    public static func projectApp(
        name: String,
        product: Product,
        platform: Platform = MainPlatform,
        //resources: [FileElement]? = nil, //??????
        resources: ResourceFileElements? = nil,
        packages: [Package] = [],
        actions: [TargetScript] = [],
        dependencies: [TargetDependency] = [],
        settings: Settings? = nil,
        infoPlist: InfoPlist
    ) -> Project {
        let targets = buildMainAppTargets(name: name,
                                          platform: platform,
                                          product: product,
                                          settings: settings,
                                          resources: resources,
                                          actions: actions,
                                          dependencies: dependencies,
                                          infoPlist: infoPlist
        )
        // tuist 에서 프로젝트를 만드는 방식
        // 공식문서 https://docs.tuist.io/manifests/project/
        return Project(
            name: name,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: [
                Scheme(
                    name: MainAppName + "-DEV",
                    shared: true,
                    buildAction: BuildAction(targets: [.init(stringLiteral: MainAppName)]),
                    runAction: .runAction(configuration: "Debug"),
                    archiveAction: .archiveAction(configuration: "Release"),
                    profileAction: .profileAction(configuration: "Release"),
                    analyzeAction: .analyzeAction(configuration: "Debug")
                ),
                Scheme(
                    name: MainAppName + "-PROD",
                    shared: true,
                    buildAction: BuildAction(targets: [.init(stringLiteral: MainAppName)]),
                    runAction: .runAction(configuration: "Release"),
                    archiveAction: .archiveAction(configuration: "Release"),
                    profileAction: .profileAction(configuration: "Release"),
                    analyzeAction: .analyzeAction(configuration: "Release")
                )
            ],
            resourceSynthesizers: []
        )
    }
    
    //메인앱 빌드 세팅 가져오는 코드
    private static func buildSettings(name: String) -> Settings {
        return .settings(base: MainBuildSetting,
                         configurations: [
                            .debug(name: "Debug"),
                            .release(name: "Release")
                         ],
                         defaultSettings: .recommended)
    }
    
    
    private static func buildMainAppTargets(name: String,
                                            platform: Platform,
                                            product: Product,
                                            settings: Settings? = nil,
                                            resources: ResourceFileElements? = nil,
                                            actions: [TargetScript] = [],
                                            dependencies: [TargetDependency] = [],
                                            infoPlist: InfoPlist
    ) -> [Target] {
        var targets: [Target] = []
        targets.append (
            Target(
                name: name,
                platform: platform,
                product: product,
                bundleId: MainBundleId,
                deploymentTarget: .iOS(targetVersion: "15.0",
                                       devices: .iphone,
                                       supportsMacDesignedForIOS: false),
                infoPlist: infoPlist,
                sources: ["Projects/\(name)/Sources/**"],
                resources: resources,  //???
                headers: .none,
                entitlements: .none,
                scripts: actions,
                dependencies: dependencies,
                settings: settings
            )
        )
        
        return targets
    }
    
}

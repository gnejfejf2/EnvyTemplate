import ProjectDescription

public let MainAppName: String = "EnvyTemplate"
public let MainBundleId: String = "co.kr.EnvyTemplate.Tuist"
public let MainDeploymentTarget = ProjectDescription.DeploymentTarget.iOS(targetVersion: "15.0", devices: .iphone)
public let MainPlatform: Platform = .iOS
public let MainBuildSetting : [String: SettingValue] =
[
    "GCC_PREPROCESSOR_DEFINITIONS": "$(inherited) ",
    "OTHER_LDFLAGS": "$(inherited)",
    
    // iOS 실제 기기에서는 arm64만 지원 (오래된 아키텍처 제외)
    "EXCLUDED_ARCHS[sdk=iphoneos*]": "i386 x86_64",
    
    // 시뮬레이터는 실행 환경에 따라 다르게 설정
    // 애플 실리콘 맥에서 실행 시
    "EXCLUDED_ARCHS[sdk=iphonesimulator*][arch=arm64]": "",
    // 인텔 맥에서 실행 시
    "EXCLUDED_ARCHS[sdk=iphonesimulator*][arch=x86_64]": "",
    
    "ONLY_ACTIVE_ARCH": "YES",
    "ENABLE_BITCODE": "NO",
    
    // 모든 지원 아키텍처 명시
    "VALID_ARCHS": "arm64 arm64e x86_64",
    "SWIFT_VERSION": "5.9"
]

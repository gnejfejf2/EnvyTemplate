import Foundation
import ProjectDescription

public enum ModulePaths {
    case feature(Feature) // 피처단위 영역
    case core(Core) // 앱의 필수기능영역 / 로그인매니저 / GPS매니저 등
    case shared(Shared) // 앱의 Network / LocalDB 영역
    case entity(Entity) // 최하단 영역
}

public extension ModulePaths {
    func targetName(type: MicroTargetType) -> String {
        switch self {
        case .feature(let module as any MicroTargetPathConvertable):
            return module.targetName(type: type)

        case .core(let module as any MicroTargetPathConvertable):
            return module.targetName(type: type)

        case .shared(let module as any MicroTargetPathConvertable):
            return module.targetName(type: type)

        case .entity(let module as any MicroTargetPathConvertable):
            return module.targetName(type: type)
        }
    }
}

// MARK: Feature
public extension ModulePaths {
    enum Feature: String, MicroTargetPathConvertable, CaseIterable {
        case FeatureBase                       // 베이스 디펜던시
        case SampleAppHelper
        case TestFeatureA
        case TestFeatureB
    }
}


// MARK: Core
public extension ModulePaths {
    enum Core: String, MicroTargetPathConvertable {
        case DesignSystem
        case CoreService
    }
}

// MARK: shared
public extension ModulePaths {
    enum Shared: String, MicroTargetPathConvertable {
        case Network
        case LocalDB
    }
}

// MARK: entity
public extension ModulePaths {
    enum Entity: String, MicroTargetPathConvertable {
        case EnvyEntities
    }
}

public enum MicroTargetType: String {
    case feature = "Feature"
    case interface = "Interface"
    case kit = "Kit"
    case adapters = "Adapters"
    case thirdPartyKit = "ThirdPartyKit"
    case noType = ""
}

public protocol MicroTargetPathConvertable {
    func targetName(type: MicroTargetType) -> String
}

public extension MicroTargetPathConvertable where Self: RawRepresentable {
    func targetName(type: MicroTargetType) -> String {
        "\(self.rawValue)\(type.rawValue)"
    }
}

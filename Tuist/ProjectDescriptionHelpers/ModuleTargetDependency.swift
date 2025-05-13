import Foundation
import ProjectDescription

// MARK: TargetDependency + Feature
public extension TargetDependency {
    static func feature(
        target: ModulePaths.Feature,
        type: MicroTargetType) -> TargetDependency {
            return .project(
                target: target.targetName(type: type),
                path: .relativeToFeature("\(target.rawValue)/\(target.targetName(type: type))")
            )
        }
}


// MARK: TargetDependency + Core
public extension TargetDependency {
    static func core(
        target: ModulePaths.Core,
        type: MicroTargetType) -> TargetDependency {
            return .project(
                target: target.targetName(type: type),
                path: .relativeToCore("\(target.rawValue)/\(target.targetName(type: type))")
            )
        }
    
}

// MARK: TargetDependency + Shared
public extension TargetDependency {
    static func shared(
        target: ModulePaths.Shared,
        type: MicroTargetType) -> TargetDependency {
            .project(
                target: target.targetName(type: type),
                path: .relativeToShared("\(target.rawValue)/\(target.targetName(type: type))")
            )
        }
    static func sharedTestSources(
        target: ModulePaths.Shared,
        type: MicroTargetType) -> TargetDependency {
            .project(
                target: target.targetName(type: type) + "TestSources",
                path: .relativeToShared("\(target.rawValue)/\(target.targetName(type: type))")
            )
        }
}

// MARK: TargetDependency + Entity
public extension TargetDependency {
    static func entity(
        target: ModulePaths.Entity,
        type: MicroTargetType) -> TargetDependency {
            return .project(
                target: target.targetName(type: type),
                path: .relativeToEntity("\(target.targetName(type: type))")
            )
        }
}


public extension ProjectDescription.Path {
    static func relativeToFeature(_ path: String) -> Self {
        return .relativeToRoot("Projects/4_FeatureLayer/\(path)")
    }
    static func relativeToCore(_ path: String) -> Self {
        return .relativeToRoot("Projects/3_CoreLayer/\(path)")
    }
    static func relativeToShared(_ path: String) -> Self {
        return .relativeToRoot("Projects/2_SharedLayer/\(path)")
    }
    static func relativeToEntity(_ path: String) -> Self {
        return .relativeToRoot("Projects/1_EntitiesLayer/\(path)")
    }
}

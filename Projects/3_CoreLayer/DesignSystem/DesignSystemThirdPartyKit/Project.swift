//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Core.DesignSystem.targetName(type: .thirdPartyKit),
                             moduleTargets: [
                                .staticLibrary
                             ],
                             dependencies: [
                                .xcframework(path: .relativeToRoot("ThirdParty/DesignSystem/SnapKit.xcframework"),
                                             status: .required,
                                             condition: nil)
                             ])

//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Core.DesignSystem.targetName(type: .kit),
                             moduleTargets: [
                                .dynamicFramework
                             ],
                             dependencies: [
                                .core(target: .DesignSystem, type: .thirdPartyKit)
                             ])

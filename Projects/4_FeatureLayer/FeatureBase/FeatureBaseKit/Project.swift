//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Feature.FeatureBase.targetName(type: .kit),
                             moduleTargets: [
                                .dynamicFramework
                             ],
                             dependencies: [
                                .shared(target: .LocalDB, type: .interface),
                                .shared(target: .Network, type: .interface),
                                .core(target: .DesignSystem, type: .kit),
                                .core(target: .CoreService, type: .interface)
                             ])

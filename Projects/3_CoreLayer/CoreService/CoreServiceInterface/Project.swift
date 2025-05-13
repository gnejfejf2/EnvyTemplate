//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Core.CoreService.targetName(type: .interface),
                             moduleTargets: [
                                .dynamicFramework
                             ],
                             dependencies: [
                                .shared(target: .LocalDB, type: .interface)
//                                .core(target: .CoreService, type: .thirdPartyKit)
                             ])

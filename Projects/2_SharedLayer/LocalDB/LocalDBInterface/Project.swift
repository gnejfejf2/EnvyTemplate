//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Shared.LocalDB.targetName(type: .interface),
                             moduleTargets: [
                                .dynamicFramework
                             ],
                             dependencies: [
                                .entity(target: .EnvyEntities, type: .interface)
                             ])

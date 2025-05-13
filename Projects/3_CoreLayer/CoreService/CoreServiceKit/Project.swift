//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.module(name: ModulePaths.Core.CoreService.targetName(type: .kit),
                             moduleTargets: [
                                .staticLibrary
                             ],
                             dependencies: [
                                .core(target: .CoreService, type: .interface)
                             ])

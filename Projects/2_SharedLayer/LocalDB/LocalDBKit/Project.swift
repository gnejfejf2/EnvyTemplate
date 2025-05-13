//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//

import ProjectDescription
import ProjectDescriptionHelpers
//
let project = Project.module(name: ModulePaths.Shared.LocalDB.targetName(type: .kit),
                             moduleTargets: [
                                .staticLibrary,
                                .testSourceModule,
                                .unitTest
                             ],
                             dependencies: [
                                .shared(target: .LocalDB, type: .interface)
                             ])

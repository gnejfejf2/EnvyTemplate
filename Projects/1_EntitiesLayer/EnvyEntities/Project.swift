//
//  Projecy.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//
import ProjectDescription
import ProjectDescriptionHelpers
//
let project = Project.module(name: ModulePaths.Entity.EnvyEntities.targetName(type: .noType),
                             moduleTargets: [
                                .staticLibrary
                             ],
                             dependencies: [
                                .entity(target: .EnvyEntities, type: .thirdPartyKit)
                             ])

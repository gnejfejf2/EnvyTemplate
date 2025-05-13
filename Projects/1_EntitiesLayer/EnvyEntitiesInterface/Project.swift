//
//  Projecy.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 13/04/2025.
//
import ProjectDescription
import ProjectDescriptionHelpers
//
let project = Project.module(name: ModulePaths.Entity.EnvyEntities.targetName(type: .interface),
                             moduleTargets: [
                                .dynamicFramework
                             ],
                             dependencies: [
                                .entity(target: .EnvyEntities, type: .noType)
                             ])

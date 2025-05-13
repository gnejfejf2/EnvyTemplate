//
//  CollectionExtension.swift
//  EnvyEntities
//
//  Created by 강지윤 on 4/25/25.
//
import Foundation

public extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}

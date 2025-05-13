//
//  FeatureInjectable.swift
//  FeatureBaseKit
//
//  Created by 강지윤 on 4/23/25.
//

public protocol FeatureInjectable: AnyObject {
    var key: FeatureInjectKey { get }
}

//
//  FeatureAInjectItem.swift
//  TestFeatureBFeature
//
//  Created by 강지윤 on 5/13/25.
//
import FeatureBaseKit
import UIKit
import TestFeatureBInterface

public final class FeatureBInjectItem: FeatureBInjectable {
    public var key: FeatureInjectKey = .FeatureB
    
    public init() { }
    
    public func openFeatureB(navigationController: UINavigationController?,
                             diContainer: DIContainerProtocol) {
        let coordinator = FeatureBCoordinator(viewParameter: .init(),
                                              baseViewController: navigationController,
                                              diContainter: diContainer)
        coordinator.start(animated: true)
    }
}

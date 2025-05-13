//
//  FeatureBInjectItem.swift
//  EnvyTemplate
//
//  Created by 강지윤 on 5/13/25.
//
import FeatureBaseKit
import UIKit
import TestFeatureBInterface

final class FeatureBInjectItem: FeatureBInjectable {
    var key: FeatureInjectKey = .FeatureB
    
    init() { }
    
    func openFeatureB(navigationController: UINavigationController?,
                      diContainer: DIContainerProtocol,
                      delegate: FeatureBDeletate) {
        let coordinator = FeatureBCoordinator(viewParameter: .init(),
                                              baseViewController: navigationController,
                                              diContainter: diContainer,
                                              delegate: delegate)
        coordinator.start(animated: true)
    }
}

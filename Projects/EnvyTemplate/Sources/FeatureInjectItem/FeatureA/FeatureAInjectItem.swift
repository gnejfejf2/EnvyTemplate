//
//  FeatureA.swift
//  EnvyTemplate
//
//  Created by 강지윤 on 5/13/25.
//
import FeatureBaseKit
import UIKit
import TestFeatureAInterface

final class FeatureAInjectItem: FeatureAInjectable {
    var key: FeatureInjectKey = .FeatureA
    
    init() { }
    
    func openFeatureA(navigationController: UINavigationController?,
                      diContainer: DIContainerProtocol) {
        let coordinator = FeatureACoordinator(viewParameter: .init(),
                                              baseViewController: navigationController,
                                              diContainter: diContainer)
        coordinator.start(animated: true)
    }
}

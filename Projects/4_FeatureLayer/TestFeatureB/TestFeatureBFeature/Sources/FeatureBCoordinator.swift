//
//  FeatureACoordinator.swift
//  TestFeatureBFeature
//
//  Created by 강지윤 on 5/13/25.
//
import UIKit
import FeatureBaseKit

protocol FeatureBCoordinatorProtocol: BaseCoordinatorProtocol { }

class FeatureBCoordinator: FeatureBCoordinatorProtocol {
    
    struct ViewParameter {
        
    }
    
    var viewParameter: ViewParameter
    
    var baseViewController: UINavigationController?
    
    var diContainter: any DIContainerProtocol
    
    init(viewParameter: ViewParameter,
         baseViewController: UINavigationController?,
         diContainter: any DIContainerProtocol) {
        self.viewParameter = viewParameter
        self.baseViewController = baseViewController
        self.diContainter = diContainter
    }
    
    func start(animated: Bool) {
        let viewController = FeatureBViewController(coordinator: self)
        baseViewController?.pushViewController(viewController, animated: true)
    }
    
    
}

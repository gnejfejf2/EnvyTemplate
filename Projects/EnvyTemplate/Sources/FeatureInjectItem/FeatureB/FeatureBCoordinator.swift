//
//  FeatureACoordinator.swift
//  TestFeatureBFeature
//
//  Created by 강지윤 on 5/13/25.
//
import UIKit
import FeatureBaseKit
import TestFeatureBFeature
import TestFeatureBInterface

class FeatureBCoordinator: FeatureBCoordinatorProtocol {
    
    struct ViewParameter {
        
    }
    
    var viewParameter: ViewParameter
    
    var baseViewController: UINavigationController?
    
    var diContainter: any DIContainerProtocol
    
    weak var delegate: FeatureBDeletate?
    
    init(viewParameter: ViewParameter,
         baseViewController: UINavigationController?,
         diContainter: any DIContainerProtocol,
         delegate: FeatureBDeletate?) {
        self.viewParameter = viewParameter
        self.baseViewController = baseViewController
        self.diContainter = diContainter
        self.delegate = delegate
    }
    
    func start(animated: Bool) {
        let viewController = FeatureBViewController(coordinator: self,
                                                    delegate: delegate)
        baseViewController?.pushViewController(viewController, animated: true)
    }
}

//
//  FeatureBCoordinator.swift
//  TestFeatureAFeature
//
//  Created by 강지윤 on 5/13/25.
//
import UIKit
import FeatureBaseKit
import TestFeatureBInterface

protocol FeatureACoordinatorProtocol {
    func openFeatureB()
}

class FeatureACoordinator: BaseCoordinatorProtocol,
                           FeatureACoordinatorProtocol {
    
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
        let viewController = FeatureAViewController(coordinator: self)
        baseViewController?.pushViewController(viewController, animated: true)
    }
    
    func openFeatureB() {
        Task {
            let featureB = await diContainter.featureContainer.resolveAdapter(for: .FeatureB) as? FeatureBInjectable
            await MainActor.run {
                featureB?.openFeatureB(navigationController: baseViewController,
                                       diContainer: diContainter)
            }
        }
    }
    
    
}


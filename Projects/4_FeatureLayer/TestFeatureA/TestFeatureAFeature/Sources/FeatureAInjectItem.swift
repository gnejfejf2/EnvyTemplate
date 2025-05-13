//
import FeatureBaseKit
import UIKit
import TestFeatureAInterface

public final class FeatureAInjectItem: FeatureAInjectable {
    public var key: FeatureInjectKey = .FeatureA
    
    public init() { }
    
    public func openFeatureA(navigationController: UINavigationController?,
                             diContainer: DIContainerProtocol) {
        let coordinator = FeatureACoordinator(viewParameter: .init(),
                                              baseViewController: navigationController,
                                              diContainter: diContainer)
        coordinator.start(animated: true)
    }
}

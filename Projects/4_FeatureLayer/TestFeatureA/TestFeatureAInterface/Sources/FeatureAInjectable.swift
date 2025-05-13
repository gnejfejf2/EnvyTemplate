//
import UIKit
import FeatureBaseKit

public protocol FeatureAInjectable: FeatureInjectable {
    func openFeatureA(navigationController: UINavigationController?,
                      diContainer: DIContainerProtocol)
}

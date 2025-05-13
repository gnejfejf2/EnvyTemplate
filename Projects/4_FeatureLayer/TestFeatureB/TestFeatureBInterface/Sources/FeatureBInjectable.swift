//
import UIKit
import FeatureBaseKit

public protocol FeatureBInjectable: FeatureInjectable {
    func openFeatureB(navigationController: UINavigationController?,
                      diContainer: DIContainerProtocol)
}

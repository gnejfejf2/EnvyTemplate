import EnvyEntities
import LocalDBInterface
import NetworkInterface
import UIKit
import NetworkAdapters
import NetworkKit
import CoreServiceInterface
import CoreServiceKit
import FeatureBaseKit
import LocalDBKit
import LocalDBAdapters
import TestFeatureAInterface

@main class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    lazy var localDBContainer = MainLocalDBContainer()
    
    lazy var diContainer = DIContainer(localDBContainer: MainLocalDBContainer(),
                                  networkContainer: MainNetworkContainer(),
                                  coreServiceContainer: MainCoreServiceContainer(localDBContainer: localDBContainer),
                                  featureContainer: MainFeatureContainer())

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
    ) -> Bool {
        Task {
            await setWindow()
        }
       
        return true
    }
    
    private func setWindow() async {
        let navigationController = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = navigationController
        window?.clipsToBounds = true
        window?.safeAreaInsetsDidChange()
        window?.makeKeyAndVisible()
        let mainView = await diContainer.featureContainer.resolveAdapter(for: .FeatureA) as? FeatureAInjectable
        mainView?.openFeatureA(navigationController: navigationController,
                               diContainer: diContainer)
    }
    
}

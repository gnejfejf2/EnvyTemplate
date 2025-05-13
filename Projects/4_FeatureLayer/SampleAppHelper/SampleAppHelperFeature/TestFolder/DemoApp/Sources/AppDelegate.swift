import EnvyEntities
import LocalDBInterface
import NetworkInterface
import UIKit
import SampleAppHelperInterface
@testable import SampleAppHelperFeature

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setWindow()
        featureInject()
        mockNetworkInject()
        return true
    }
    
    private func setWindow() {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.overrideUserInterfaceStyle = .light
        window?.rootViewController = navigationController
        window?.clipsToBounds = true
        window?.safeAreaInsetsDidChange()
        window?.makeKeyAndVisible()
        startView(navigationController: navigationController)
    }
    
    private func featureInject() {
    
    }
    
    private func mockNetworkInject() {
    
    }
    
    ///데모앱을 시작할 피처를 등록해주세요
    ///ex
    ///private func startView(navigationController: UINavigationController) {
    ///     let favoriteViewCoordinator = FavoriteViewCoordinator(viewParameter: .init(),
    ///                                                           navigationController: navigationController,
    ///                                                           localDBAdaptersContainer: demoAppDelegateRegisterManager.localDBAdaptersContainer,
    ///                                                           networkAdaptersContainer: demoAppDelegateRegisterManager.networkAdaptersContainer,
    ///                                                           trackingContainer: demoAppDelegateRegisterManager.trackingContainer,
    ///                                                           coreServiceContainer: demoAppDelegateRegisterManager.coreServiceContainer,
    ///                                                           componentServiceContainer: demoAppDelegateRegisterManager.componentServiceContainer,
    ///                                                           baseFeatureContainer: demoAppDelegateRegisterManager.baseFeatureContainer,
    ///                                                           nimated: true)
    ///     favoriteViewCoordinator.start(completion: nil)
    ///}
    private func startView(navigationController: UINavigationController) {
    
    }
}

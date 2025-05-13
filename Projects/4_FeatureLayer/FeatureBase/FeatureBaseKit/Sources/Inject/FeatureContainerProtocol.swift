import Foundation

public protocol FeatureContainerProtocol {
    func registerAdapter(_ item: FeatureInjectable) async
    func resolveAdapter(for key: FeatureInjectKey) async -> FeatureInjectable?
}

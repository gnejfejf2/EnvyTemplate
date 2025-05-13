import Foundation

public protocol CoreServiceContainerProtocol {
    func registerAdapter(_ item: CoreServiceInjectable) async
    func resolveAdapter(for key: CoreServiceInjectKey) async -> CoreServiceInjectable?
}

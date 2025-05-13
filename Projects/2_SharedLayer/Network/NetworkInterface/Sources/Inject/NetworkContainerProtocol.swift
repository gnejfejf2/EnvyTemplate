import Foundation

public protocol NetworkContainerProtocol {
    func registerAdapter(_ item: NetworkInjectable) async
    func resolveAdapter(for key: NetworkInjectKey) async -> NetworkInjectable?
}

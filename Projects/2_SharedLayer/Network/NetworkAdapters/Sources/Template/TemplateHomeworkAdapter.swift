import Foundation
import EnvyEntities
import NetworkInterface
import NetworkKit

public final class TemplateAdapter: TemplateAdapterProtocol {
    public let key: NetworkInjectKey = .Template
    
    private let networkProvider: NetworkProviderProtocol
    
    public init (networkProvider: NetworkProviderProtocol) {
        self.networkProvider = networkProvider
    }
}

//
//  MainNetworkContainer.swift
//  tosshomeworkSample
//
//  Created by 강지윤 on 4/26/25.
//
import NetworkInterface
import NetworkAdapters
import NetworkKit

final actor MainNetworkContainer: NetworkContainerProtocol {
    private var adapters: [NetworkInjectKey: NetworkInjectable] = [:]

    
    func registerAdapter(_ item: NetworkInjectable) async {
        adapters.updateValue(item, forKey: item.key)
    }
    
    func resolveAdapter(for key: NetworkInjectKey) async -> NetworkInjectable? {
        if let injectItem = adapters[key] {
            return injectItem
        } else {
            switch key {
            case .Template:
                return adapters[key]
            }
        }
    }
}

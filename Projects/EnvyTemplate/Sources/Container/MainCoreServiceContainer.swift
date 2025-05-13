//
//  MainCoreServiceContainer.swift
//
//  Created by 강지윤 on 4/26/25.
//
import CoreServiceInterface
import CoreServiceKit
import LocalDBInterface

final actor MainCoreServiceContainer: CoreServiceContainerProtocol {
    private var adapters: [CoreServiceInjectKey: CoreServiceInjectable] = [:]

    private let localDBContainer: LocalDBContainerProtocol
    
    init(localDBContainer: LocalDBContainerProtocol) {
        self.localDBContainer = localDBContainer
    }
    
    func registerAdapter(_ item: CoreServiceInjectable) async {
        adapters.updateValue(item, forKey: item.key)
    }
    
    func resolveAdapter(for key: CoreServiceInjectKey) async -> CoreServiceInjectable? {
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

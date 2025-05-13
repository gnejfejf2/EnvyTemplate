//
//  MainLocalDBContainer.swift
//  tosshomeworkSample
//
//  Created by 강지윤 on 4/26/25.
//
import LocalDBInterface
import LocalDBKit
import LocalDBAdapters

final actor MainLocalDBContainer: LocalDBContainerProtocol {
    private var adapters: [LocalDBInjectKey: LocalDBInjectable] = [:]

    
    func registerAdapter(_ item: LocalDBInjectable) async {
        adapters.updateValue(item, forKey: item.key)
    }
    
    func resolveAdapter(for key: LocalDBInjectKey) async -> LocalDBInjectable? {
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


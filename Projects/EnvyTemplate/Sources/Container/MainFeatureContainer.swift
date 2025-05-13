//
//  MainFeatureContainer.swift
//  tosshomeworkSample
//
//  Created by 강지윤 on 4/26/25.
//
import FeatureBaseKit
import TestFeatureAFeature
import TestFeatureBFeature


final actor MainFeatureContainer: FeatureContainerProtocol {
    private var adapters: [FeatureInjectKey: FeatureInjectable] = [:]

    
    func registerAdapter(_ item: FeatureInjectable) async {
        adapters.updateValue(item, forKey: item.key)
    }
    
    func resolveAdapter(for key: FeatureInjectKey) async -> FeatureInjectable? {
        if let injectItem = adapters[key] {
            return injectItem
        } else {
            switch key {
            case .FeatureA:
                let injectItem = FeatureAInjectItem()
                await registerAdapter(injectItem)
                return adapters[key]
            case .FeatureB:
                let injectItem = FeatureBInjectItem()
                await registerAdapter(injectItem)
                return adapters[key]
            }
        }
    }
}

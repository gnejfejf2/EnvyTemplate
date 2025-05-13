//
//  MainAppContainer.swift
//
//  Created by 강지윤 on 4/26/25.
//
import FeatureBaseKit
import LocalDBInterface
import NetworkInterface
import CoreServiceInterface

final class DIContainer: DIContainerProtocol {
    
    let localDBContainer: LocalDBContainerProtocol
    
    let networkContainer: NetworkContainerProtocol
    
    let coreServiceContainer: CoreServiceContainerProtocol
    
    let featureContainer: FeatureContainerProtocol
    
    init(localDBContainer: LocalDBContainerProtocol,
         networkContainer: NetworkContainerProtocol,
         coreServiceContainer: CoreServiceContainerProtocol,
         featureContainer: FeatureContainerProtocol) {
        self.localDBContainer = localDBContainer
        self.networkContainer = networkContainer
        self.coreServiceContainer = coreServiceContainer
        self.featureContainer = featureContainer
    }
    
}

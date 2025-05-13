//
//  DIContainerProtocol.swift
//  FeatureBaseKit
//
//  Created by 강지윤 on 4/26/25.
//
import LocalDBInterface
import NetworkInterface
import CoreServiceInterface

public protocol DIContainerProtocol {
    var localDBContainer: LocalDBContainerProtocol { get }
    var networkContainer: NetworkContainerProtocol { get }
    var coreServiceContainer: CoreServiceContainerProtocol { get }
    var featureContainer: FeatureContainerProtocol { get }
}
 

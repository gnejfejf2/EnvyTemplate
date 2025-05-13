//
//  BaseCoordinatorProtocol.swift
//  FeatureBaseInterface
//
//  Created by Envy on 14/4/25.
//
import Foundation
import UIKit

public protocol BaseCoordinatorProtocol: AnyObject {
    associatedtype ViewParameter
    associatedtype BaseViewController
    var viewParameter: ViewParameter { get }
    var diContainter: DIContainerProtocol { get }
    var baseViewController: BaseViewController? { get }
    
    /// Coordinator start
    func start(animated: Bool)
}


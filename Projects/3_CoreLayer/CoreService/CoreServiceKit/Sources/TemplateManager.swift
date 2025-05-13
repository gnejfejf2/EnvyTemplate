import Foundation
import CoreServiceInterface
import Combine
import LocalDBInterface

public final actor TemplateManager: @preconcurrency TemplateManagerProtocol {
    public let key: CoreServiceInjectKey = .Template
   
    
}

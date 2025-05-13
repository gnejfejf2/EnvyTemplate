import Foundation

public protocol CoreServiceInjectable: AnyObject {
    var key: CoreServiceInjectKey { get }
}

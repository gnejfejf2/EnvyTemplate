import Foundation

public protocol LocalDBInjectable: AnyObject {
    var key: LocalDBInjectKey { get }
}

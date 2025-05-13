import Foundation

public enum TemplatePath {
    case template
    
    var path: String {
        switch self {
        case .template:
            return ""
        }
    }
}

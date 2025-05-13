//
//  dommy.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 20/09/2023.
//

import Foundation
import EnvyEntities
import LocalDBInterface


public final class TemplateAdapter: TemplateAdapterProtocol {
    
    
    public let key: LocalDBInjectKey = .Template
    
    let localDBProvider: LocalDBProviderProtocol
    let jsonDecoder = JSONDecoder()
    private let localKeyword: String = "Template"
    private let requstedKeyword: String = "RequstedKeyword"
    
    public init(localDBProvider: LocalDBProviderProtocol) {
        self.localDBProvider = localDBProvider
    }
    
}

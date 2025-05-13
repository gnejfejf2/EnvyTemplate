//
//  dommy.swift
//  ProjectDescriptionHelpers
//
//  Created by Envy on 20/09/2023.
//

import Foundation

public protocol LocalDBContainerProtocol {
    func registerAdapter(_ item: LocalDBInjectable) async
    func resolveAdapter(for key: LocalDBInjectKey) async -> LocalDBInjectable?
}

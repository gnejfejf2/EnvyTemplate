//
//  NetworkInjectable.swift
//  NetworkInterface
//
//  Created by 강지윤 on 4/23/25.
//

public protocol NetworkInjectable: AnyObject {
    var key: NetworkInjectKey { get }
}

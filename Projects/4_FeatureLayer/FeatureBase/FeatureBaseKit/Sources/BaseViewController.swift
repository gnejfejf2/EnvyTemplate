//
//  BaseViewController.swift
//  FeatureBaseInterface
//
//  Created by Envy on 14/4/25.
//

import Foundation
import UIKit

public protocol BaseViewControllerProtocol {
    associatedtype Coordinator
    var coordinator: Coordinator { get }
    //view.add , snp 옵션 로직등이 이곳에서 설정된다
    func makeUI()
    //ui 옵션들이 설정되는공간이다
    //델리게이트설정 , 백그라운드설정 등이 이루어진다
    func bindUI()
}

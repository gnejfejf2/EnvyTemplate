//
//  FeatureBViewController.swift
//  TestFeatureAFeature
//
//  Created by 강지윤 on 5/13/25.
//
import UIKit
import SnapKit
import FeatureBaseKit
import TestFeatureAInterface

public final class FeatureAViewController: UIViewController, BaseViewControllerProtocol {
    public var coordinator: any FeatureACoordinatorProtocol
    
    var label = UILabel()
    var button = UIButton()
    
    public init(coordinator: any FeatureACoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        makeUI()
        bindUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func makeUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        label.text = "화면 A"
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.top.equalTo(label.snp.bottom).offset(10)
            make.centerX.equalToSuperview()
            make.height.equalTo(30)
        }
        button.setTitleColor(.blue, for: .normal)
        button.setTitle("화면 B 넘어가기", for: .normal)
        button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
    }
    
    public func bindUI() {
        
    }
    
    @objc private func onTapButton() {
        coordinator.openFeatureB(delegate: self)
    }
}

extension FeatureAViewController: FeatureBDeletate {
    public func featureBViewDidLoad() {
        print("Envy: featureBViewDidLoad")
    }
}

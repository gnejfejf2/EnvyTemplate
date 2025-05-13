//
//  LoadingView.swift
//  DesignSystemKit
//
//  Created by 강지윤 on 4/26/25.
//
import UIKit
import SnapKit

public final class LoadingView: UIView {

    private let activityIndicator: UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView(style: .large)
        activity.color = .gray
        return activity
    }()
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        return view
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }

    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func makeUI() {
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.width.height.equalTo(50)
            make.center.equalToSuperview()
        }
    }

    public func show() {
        isHidden = false
        activityIndicator.startAnimating()
    }

    public func hide() {
        isHidden = true
        activityIndicator.stopAnimating()
    }
}

//
import UIKit
import SnapKit
import FeatureBaseKit

final class FeatureBViewController: UIViewController, BaseViewControllerProtocol {
    var coordinator: any FeatureBCoordinatorProtocol
    var label = UILabel()
    init(coordinator: any FeatureBCoordinatorProtocol) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
        makeUI()
        bindUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func makeUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        label.text = "화면 B"
    }
    
    func bindUI() {
        
    }
    
}

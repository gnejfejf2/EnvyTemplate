//
import UIKit
import SnapKit
import FeatureBaseKit
import TestFeatureBInterface

public final class FeatureBViewController: UIViewController, BaseViewControllerProtocol {
    public var coordinator: any FeatureBCoordinatorProtocol
    var label = UILabel()
    
    public weak var delegate: FeatureBDeletate?
    
    public init(coordinator: any FeatureBCoordinatorProtocol,
                delegate: FeatureBDeletate?) {
        self.coordinator = coordinator
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
        makeUI()
        bindUI()
    }
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        delegate?.featureBViewDidLoad()
    }
    
    public func makeUI() {
        view.backgroundColor = .white
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        label.text = "화면 B"
    }
    
    public func bindUI() {
        
    }
    
}

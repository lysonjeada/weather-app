import UIKit

class StatsLabel: UIStackView {
    
    private lazy var textName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "contrastColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var valueField: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = UIColor(named: "contrastColor")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var customStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: ([textName, valueField]))
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
     init(text: String, value: String) {
        super.init(frame: .zero)
        textName.text = text
        valueField.text = value
    }
    
    required init(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
}

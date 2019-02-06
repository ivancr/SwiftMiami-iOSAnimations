import UIKit

extension UIButton {
    
    func configureBasicBlueButton(title: String) {
        setTitle(title, for: .normal)
        backgroundColor = Globals.themeColor
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 20
    }
    
    func configureBasicWhiteButton(title: String) {
        setTitle(title, for: .normal)
        backgroundColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        setTitleColor(Globals.themeColor, for: .normal)
        layer.cornerRadius = 20
    }
}


extension CGRect {
    
    static var buttonFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 192, height: 64)
    }
    
    static var textFieldFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 256, height: 56)
    }
}

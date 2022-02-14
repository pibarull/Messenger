//
//  CustomTextField.swift
//  Messenger
//
//  Created by Ilia Ershov on 14.02.2022.
//

import Foundation
import UIKit

private enum Constants {

    static let cornerRadius: CGFloat = 12
    static let borderWidth: CGFloat = 1
}

class CustomTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        autocapitalizationType = .none
        autocorrectionType = .no
        returnKeyType = .done
        layer.borderWidth = Constants.borderWidth
        layer.cornerRadius = Constants.cornerRadius
        layer.borderColor = UIColor.lightGray.cgColor
    }

    override func updateConstraints() {
        super.updateConstraints()

        leftView = UIView(frame: .init(x: 0,
                                       y: 0,
                                       width: 5,
                                       height: 0))
        rightView = UIView(frame: .init(x: self.right-5,
                                        y: 0,
                                        width: 5,
                                        height: 0))

        leftViewMode = .always
        leftView?.backgroundColor = .white
        rightViewMode = .always
        rightView?.backgroundColor = .white
    }

    func setPlaceholder(with text: String) -> CustomTextField {
        placeholder = text
        return self
    }
}

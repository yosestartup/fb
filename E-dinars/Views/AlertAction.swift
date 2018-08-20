//
//  AlertAction.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 06.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//
//swiftlint:disable operator_usage_whitespace

import UIKit

enum AGAlertActionStyle: Int {
    case plain
    case bold
}

class AlertAction: UIButton {
    //*****************************************************************************/
    // MARK: - Variables, Constants and Outlets
    //*****************************************************************************/
    private var action: (() -> Void)?
    private var style: AGAlertActionStyle = .plain
    
    //*****************************************************************************/
    // MARK: - Initialization
    //*****************************************************************************/
    init() {
        super.init(frame: CGRect.zero)
        let defaultColor = UIColor(red: 59/255.0, green: 148/255.0, blue: 209/255.0, alpha: 1)
        self.backgroundColor = UIColor.white.withAlphaComponent(0.6)
        self.addTarget(self, action: #selector(self.actionTrigger), for: .touchUpInside)
        self.isExclusiveTouch = true
        self.setTitleColor(UIColor.orange, for: .highlighted)
        self.setTitleColor(UIColor.orange, for: .selected)
        self.setTitleColor(defaultColor, for: .normal)
        self.updateStyle(style)
        clipsToBounds = true
        layer.masksToBounds = true
        self.isUserInteractionEnabled = true
        self.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([self.heightAnchor.constraint(equalToConstant: 44)]) // Default one
    }
    
    convenience init(title: String?, style: AGAlertActionStyle, action: (() -> Void)? = nil) {
        self.init(title: title, action: action)
        
        self.updateStyle(style)
    }
    
    convenience init(title: String?, style: AGAlertActionStyle) {
        self.init(title: title, action: nil)
        
        self.updateStyle(style)
    }
    
    convenience init(title: String?, action: (() -> Void)? = nil) {
        self.init(title: title)
        
        self.action = action
    }
    
    convenience init(title: String?) {
        self.init()
        
        self.setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //*****************************************************************************/
    // MARK: - Appearance
    //*****************************************************************************/
    private func updateStyle(_ style: AGAlertActionStyle) {
        self.style = style
        
        switch style {
        case .plain:
            self.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        case .bold:
            self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        }
        
    }
    
    //*****************************************************************************/
    // MARK: - Actions
    //*****************************************************************************/
    @objc private func actionTrigger() {
        self.action?()
    }
    
}

//
//  CustomAlertController.swift
//  E-dinars
//
//  Created by Oleksandr Bambulyak on 04.07.2018.
//  Copyright © 2018 Oleksandr Bambulyak. All rights reserved.
//
//
//swiftlint:disable private_outlet

import UIKit

class CustomAlertContentView: UIView {
    
    /*****************************************************************************/
    // MARK: - Variables, Constants and Outlets
    //*****************************************************************************/
    @IBOutlet var roundView: UIView!
    @IBOutlet var xibMain: UIView!
    @IBOutlet var alertView: UIView! //(общий)
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var descriptionLabel: UILabel!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet var viewsStack: UIStackView!
    @IBOutlet var buttonsStack: UIStackView!
    private var contentColor = UIColor.white.withAlphaComponent(0.8)

    convenience init(title: String?, description: String?, image: UIImage?) {
        
        self.init()
        self.initializeXib()
        self.backgroundColor = .clear
        self.xibMain.backgroundColor = .clear
        
        self.alertView.backgroundColor = self.contentColor
        
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        self.imageView.image = image
    }
    
    //*****************************************************************************/
    // MARK: - Initialization
    //*****************************************************************************/
    
    private func initializeXib() {
        
        Bundle.main.loadNibNamed("CustomAlertContentView", owner: self, options: nil)
        self.translatesAutoresizingMaskIntoConstraints = false
        xibMain.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(xibMain)
        
        NSLayoutConstraint.activate([xibMain.topAnchor.constraint(equalTo: topAnchor),
                                     bottomAnchor.constraint(equalTo: xibMain.bottomAnchor),
                                     xibMain.leadingAnchor.constraint(equalTo: leadingAnchor),
                                     trailingAnchor.constraint(equalTo: xibMain.trailingAnchor)])
    }
    
    //*****************************************************************************/
    // MARK: - Actions
    //*****************************************************************************/
    internal func add(_ action: AlertAction) {
        action.backgroundColor = self.contentColor
        action.addTarget(self,
                         action: #selector(actionDidSelect(_:)),
                         for: [.touchDown, .touchDragEnter])
        action.addTarget(self,
                         action: #selector(actionDidDeselect(_:)),
                         for: [.touchUpInside, .touchDragExit, .touchCancel])
        
        self.buttonsStack.addArrangedSubview(action)
        
        let numberOfItems = self.buttonsStack.arrangedSubviews.count
        self.buttonsStack.axis = numberOfItems > 2 ? .vertical : .horizontal
    }
    
    @objc func actionDidSelect(_ sender: AlertAction) {
        UIView.animate(withDuration: 0.15) {
            sender.backgroundColor = self.contentColor.withAlphaComponent(0.3)
        }
    }
    
    @objc func actionDidDeselect(_ sender: AlertAction) {
        UIView.animate(withDuration: 0.15) {
            sender.backgroundColor = self.contentColor
        }
    }
    
}

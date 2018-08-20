//
//  MyEbayAccountTableViewCell.swift
//  SaleUp
//
//  Created by Panevnyk Vlad on 2/8/18.
//  Copyright © 2018 Devlight. All rights reserved.
//

import UIKit
import SDWebImage

final class MyEbayAccountTableViewCell: UITableViewCell {
    /// UI
    @IBOutlet private var cardContainerView: UIView!

    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var heightConstraint: NSLayoutConstraint!
    @IBOutlet private var accountNameLabel: UILabel!

    @IBOutlet private var descriptionLabel: UILabel!

    @IBOutlet var author: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    func fill(name: String, author: String, description: String, imageUrl: String, isEditable: Bool) {
        accountNameLabel.text = name
        //avatarImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        avatarImageView.contentMode = .scaleAspectFill
        //countMessageLabel.text = ""

        avatarImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        
        self.author.text = author
        descriptionLabel.text = description
       
        
        accountNameLabel.isHidden = false
        descriptionLabel.isHidden = false
        
        
        accountNameLabel.alpha = isEditable ? 0 : 1
        descriptionLabel.alpha = isEditable ? 0 : 1
      
    }
    
    func updateState(isEditable: Bool) {
        if !isEditable {
            
            author.isHidden = false
       
        }
        
        UIView.animate(withDuration: 0.25, animations: { [weak self] in
            
            self?.author.alpha = isEditable ? 0 : 1
           
        }) { [weak self] _ in
            if isEditable {
             
                self?.author.isHidden = true
              
            }
        }
    }
    
  func initialize() {
        selectionStyle = .none
        layer.masksToBounds = false
        
        backgroundColor = UIColor.clear
        
        contentView.backgroundColor = UIColor.clear
        contentView.addContainerShadow()
        
        cardContainerView.layer.backgroundColor = UIColor.white.cgColor
        cardContainerView.layer.cornerRadius = 6
        cardContainerView.layer.masksToBounds = true
        
        //centerSeparatorView.backgroundColor = UIColor.gray
        
        avatarImageView.layer.cornerRadius = 12
        avatarImageView.layer.masksToBounds = true
        //avatarImageView.image = UIImage(named: "imgAccountPlaceholder")
        
        accountNameLabel.textColor = UIColor.gray
        
        accountNameLabel.textColor = UIColor.gray
        //itemSoldTitleLabel.text = Localize("items_sold_:")
        
        descriptionLabel.textColor = UIColor.gray
        
    
        //totalSalesTitleLabel.text = Localize("total_sales:")
        
        author.textColor = UIColor.gray
    }
}

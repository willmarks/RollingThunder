//
//  CharacterCollectionViewCell.swift
//  RollingThunder
//
//  Created by Dario, Anthony on 7/12/15.
//  Copyright (c) 2015 Anthony Dario. All rights reserved.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    
    var name: String! {
        get {
            return nameLabel.text
        }
        set (newText) {
            nameLabel.text = newText
            var newLabelFrame = nameLabel.frame
            var newContentFrame = contentView.frame
            let textSize = self.dynamicType.sizeForContentString(newText, forMaxWidth: maxWidth)
            newLabelFrame.size = textSize
            newContentFrame.size = textSize
            contentView.frame = newContentFrame
        }
    }
    var maxWidth: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // set the labels properties
        nameLabel = UILabel(frame: self.contentView.frame)
        nameLabel.opaque = false
        nameLabel.backgroundColor = UIColor(red: 0.8, green: 0.9, blue: 1.0, alpha: 1.0)
        nameLabel.textColor = UIColor.blackColor()
        nameLabel.textAlignment = .Center
        nameLabel.font = self.dynamicType.defaultFont()
        contentView.addSubview(nameLabel)
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    class func sizeForContentString(s: String, forMaxWidth maxWidth: CGFloat) -> CGSize {
        
        let maxSize = CGSizeMake(maxWidth, 1000)
        let opts = NSStringDrawingOptions.UsesLineFragmentOrigin
        
        let style = NSMutableParagraphStyle()
        style.lineBreakMode = NSLineBreakMode.ByCharWrapping
        let attributes = [ NSFontAttributeName: self.defaultFont(), NSParagraphStyleAttributeName: style ]
        
        let string = s as NSString
        let rect = string.boundingRectWithSize(maxSize, options: opts,  attributes: attributes, context: nil)
        
        return rect.size
    }
    
    class func defaultFont() -> UIFont {
        return UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
    }
}

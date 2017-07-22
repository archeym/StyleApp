//
//  DesignableTextField.swift
//  GreatLookingLoginInterface
//
//  Created by Arkadijs Makarenko on 29/06/2017.
//  Copyright © 2017 ArchieApps. All rights reserved.
//

import UIKit
@IBDesignable
class DesignableTextField: UITextField {
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet{
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var leftImage : UIImage? {
        didSet{
            updateView()
        }
    }
    @IBInspectable var leftPadding: CGFloat = 0{
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: leftPadding, y: 0, width: 24, height: 24))
            imageView.image = image
            imageView.tintColor = tintColor
            
            var width = leftPadding + 24
            if borderStyle == UITextBorderStyle.none || borderStyle == UITextBorderStyle.line {
                width = width + 5
            }
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: width, height: 25))
            view.addSubview(imageView)
            leftView = view
            
        }else{
           
            leftViewMode = .never
        }
        
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ? placeholder! : "", attributes: [NSForegroundColorAttributeName: tintColor])
    }
}

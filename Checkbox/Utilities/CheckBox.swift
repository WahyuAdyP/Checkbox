//
//  CheckBox.swift
//  Tanda Mata
//
//  Created by Crocodic Studio on 6/1/16.
//  Copyright © 2016 Crocodic Studio. All rights reserved.
//

import UIKit

@IBDesignable
class CheckBox: UIButton {
    
    private var onTap: ((_ checkBox: CheckBox, _ state: Bool) -> Void)? = nil
    
    @IBInspectable var isChecked: Bool = false {
        didSet {
            updateCheckbox()
        }
    }
    
    @IBInspectable var color: UIColor? {
        didSet {
            updateCheckbox()
        }
    }
    
    @IBInspectable var checkedImage: UIImage? {
        didSet {
            updateCheckbox()
        }
    }
    
    @IBInspectable var uncheckedImage: UIImage? {
        didSet {
            updateCheckbox()
        }
    }
    
    @IBInspectable var numberOfLinesText: Int = 1 {
        didSet {
            updateCheckbox()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        updateCheckbox()
        self.addTarget(self, action: #selector(switchState), for: .touchUpInside)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        updateCheckbox()
        self.addTarget(self, action: #selector(switchState), for: .touchUpInside)
    }
    
    func setOnTap(_ method: @escaping (_ checkBox: CheckBox, _ state: Bool) -> Void) {
        self.onTap = method
    }
    
    func setState(in check: Bool) {
        self.isChecked = check
        self.sendActions(for: .valueChanged)
        
        setupTap(state: check)
    }

    @objc private func switchState() {
        self.isChecked = !self.isChecked
        self.sendActions(for: .valueChanged)
        
        setupTap(state: self.isChecked)
        
        onTap?(self, self.isChecked)
    }
    
    private func setupTap(state check: Bool) {
        updateCheckbox()
    }
    
    private func updateCheckbox() {
        if let myColor = color {
            self.tintColor = myColor
        }
        let usedColor: UIColor = tintColor
        
        if isChecked {
            let image = self.checkedImage?.mask(color: usedColor)
            self.setImage(image, for: UIControlState())
        } else {
            let image = self.uncheckedImage?.mask(color: usedColor)
            self.setImage(image, for: UIControlState())
        }
        
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.titleLabel?.numberOfLines = numberOfLinesText
    }
    
}

extension UIImage {
    fileprivate func mask(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        let context = UIGraphicsGetCurrentContext()!
        
        let rect = CGRect(origin: CGPoint.zero, size: size)
        
        color.setFill()
        self.draw(in: rect)
        
        context.setBlendMode(.sourceIn)
        context.fill(rect)
        
        let resultImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return resultImage
    }
    
}

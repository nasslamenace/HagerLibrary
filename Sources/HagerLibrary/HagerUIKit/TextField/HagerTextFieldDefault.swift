//
//  File.swift
//  
//
//  Created by Nassim Guettat on 28/04/2021.
//

import Foundation
import UIKit



@available(iOS 13.0, *)
class HagerTextFieldDefault: UITextField{
    
    private let errorIcon = UIImageView(image: UIImage(named: "error", in: .module, with: nil))
    private let border = CALayer()
    
    func configure(with frame: CGRect, from model: HagerTextFieldModel){
        
        self.frame = frame
        self.placeholder = model.placeHolder                                                                                    
        self.addSubview(errorIcon)
        clipsToBounds  = true
        
        errorIcon.frame = CGRect(x: frame.width - 35, y: frame.width/2 - 8, width: 16, height: 19)
        errorIcon.isHidden = true
        
        border.frame = CGRect(x: frame.minX, y: frame.maxY, width: frame.width, height: 1);
        border.backgroundColor = HagerColors.hagerGreyE6.cgColor
        layer.addSublayer(border)
        self.layer.borderColor = HagerColors.hagerGreyE6.cgColor
        self.layer.borderWidth = 1
        
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
            self.border.backgroundColor = HagerColors.hoverOrange.cgColor
        }
    }
    
    public func displayError(){
        errorIcon.isHidden = false
        border.backgroundColor = HagerColors.errorRed.cgColor
    }
    
    
}

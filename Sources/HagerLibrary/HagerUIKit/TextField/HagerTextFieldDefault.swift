//
//  File.swift
//  
//
//  Created by Nassim Guettat on 28/04/2021.
//

import Foundation
import UIKit

public class HagerTextFieldDefault: UITextField{
    
 
    private var errorIcon = UIImageView()
    private let border = CALayer()
    
    @available(iOS 13.0, *)
    func configure(with frame: CGRect, from model: HagerTextFieldModel){

        self.frame = frame
        self.placeholder = model.placeHolder
        
        errorIcon.image = UIImage(named: "error", in: .module, with: nil)
        errorIcon.backgroundColor = UIColor.blue
        self.addSubview(errorIcon)
        clipsToBounds  = true
        
        errorIcon.frame = CGRect(x: frame.width - 35, y: frame.width/2 - 8, width: 16, height: 19)
        errorIcon.isHidden = true
        

       
        layer.borderColor = HagerColors.errorRed.cgColor
        self.layer.borderColor = HagerColors.hagerGreyE6.cgColor
        self.layer.borderWidth = 1
        
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        border.frame = CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1);
        border.backgroundColor = HagerColors.errorRed.cgColor
        layer.addSublayer(border)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { (timer) in
                self.border.backgroundColor = HagerColors.hoverOrange.cgColor
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func displayError(){
        errorIcon.isHidden = false
        border.backgroundColor = HagerColors.errorRed.cgColor
        //layer.borderColor = HagerColors.errorRed.cgColor
        self.layoutSubviews()
    }
    
    
}

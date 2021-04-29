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
    private var isError = false {
        didSet{
            if(isError){
                errorIcon.isHidden = false
                border.backgroundColor = HagerColors.errorRed.cgColor
            }
            else{
                errorIcon.isHidden = true
                border.backgroundColor = HagerColors.errorRed.cgColor
            }
        }
    }
    
    @available(iOS 13.0, *)
    func configure(with frame: CGRect, from model: HagerTextFieldModel){

        self.frame = frame
        self.placeholder = model.placeHolder
        
        errorIcon.image = UIImage(named: "error", in: .module, with: nil)
        self.addSubview(errorIcon)
        
        errorIcon.frame = CGRect(x: frame.width - 35, y: frame.height/2 - 8, width: 16, height: 19)
        errorIcon.isHidden = true
        

       
        layer.borderColor = HagerColors.errorRed.cgColor
        self.layer.borderColor = HagerColors.hagerGreyE6.cgColor
        self.layer.borderWidth = 1
        
        self.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        border.frame = CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 2);
        border.backgroundColor = HagerColors.errorRed.cgColor
        layer.addSublayer(border)
        
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if #available(iOS 10.0, *) {
            isError = false
            self.border.backgroundColor = HagerColors.hoverOrange.cgColor
            Timer.scheduledTimer(withTimeInterval: 1.4, repeats: false) { (timer) in
                self.border.backgroundColor = HagerColors.hagerGreyE6.cgColor
            }
            
            
            
            
        } else {
            // Fallback on earlier versions
        }
    }
    
    public func displayError(){
        isError = true
    }
    
    
}

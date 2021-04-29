//
//  File.swift
//
//
//  Created by Nassim Guettat on 28/04/2021.
//

import Foundation
import UIKit

public class HagerTextFieldView: UIView{
    
    private var model : HagerTextFieldModel?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = HagerColors.hagerGrey4A
        return label
    }()
    
    private let optionalMsgLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12)
        label.textColor = HagerColors.hagerGreyAF
        return label
    }()
    
    private var textField: UITextField
    
    
    @available(iOS 13.0, *)
    public func configure(with model: HagerTextFieldModel){
        titleLabel.text = model.title
        optionalMsgLabel.text = model.optionalMessage
        

        
        switch model.style {
        case .inputDefault:
            textField = HagerTextFieldDefault()
        case .full:
            textField = HagerTextFieldDefault()
        case .inputSearch:
            textField = HagerTextFieldDefault()
        case .inputPassword:
            textField = HagerTextFieldDefault()
        case .inputPhone:
            textField = HagerTextFieldDefault()
        case .inputCountry:
            textField = HagerTextFieldDefault()
        }
        
        self.addSubview(titleLabel)
        self.addSubview(optionalMsgLabel)
        self.addSubview(textField)
        
        titleLabel.frame = CGRect(x: 5, y: 5, width: self.frame.width, height: self.frame.height*0.3)
        (textField as! HagerTextFieldDefault).configure(with: CGRect(x: 5, y: self.frame.height * 0.3 + 5, width: self.frame.width, height: self.frame.height * 0.5 ), from: model)
        optionalMsgLabel.frame = CGRect(x: 5, y: self.frame.height * 0.8 + 5, width: self.frame.width, height: self.frame.height * 0.20)
        
    }
    
    public func displayError(message: String){
        
        (textField as! HagerTextFieldDefault).displayError()
        optionalMsgLabel.text = message
        optionalMsgLabel.textColor = HagerColors.errorRed
        titleLabel.textColor = HagerColors.errorRed
        
        
    }
    

    override init(frame: CGRect) {
        model = nil
        textField = UITextField()
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        textField = UITextField()
        model = nil
        super.init(coder: coder)
    }
    
    
    

    
}

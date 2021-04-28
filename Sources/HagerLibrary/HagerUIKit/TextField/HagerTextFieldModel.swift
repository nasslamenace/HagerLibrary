//
//  File.swift
//  
//
//  Created by Nassim Guettat on 28/04/2021.
//

import Foundation
import UIKit

public struct HagerTextFieldModel{
    public let title: String
    public let style: TextFieldStyle
    public let optionalMessage: String
    public let placeHolder: String
    
    
    
    public init(title: String, style: TextFieldStyle, optionalMessage: String, placeHolder: String){
        self.title = title
        self.style = style
        self.optionalMessage = optionalMessage
        self.placeHolder = placeHolder
    }
}

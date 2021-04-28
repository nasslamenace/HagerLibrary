//
//  File.swift
//  
//
//  Created by Nassim Guettat on 28/04/2021.
//

import Foundation
import UIKit

public struct HagerButtonModel{
    public let title: String
    public let style: ButtonStyle
    
    public init(title: String, style: ButtonStyle){
        self.title = title
        self.style = style
    }
}

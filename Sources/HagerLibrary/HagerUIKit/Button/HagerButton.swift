//
//  File.swift
//  
//
//  Created by Nassim Guettat on 26/04/2021.
//

import Foundation
import UIKit
import SwiftUI

/*
@available(iOS 13.0.0, *)
struct HagerButton: View{
    
    var body: some View {
        Button {
            print("Image tapped!")
        } label: {
            Text("Button").font(.custom("Roboto Bold", size: 16)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.03).multilineTextAlignment(.center)
        }
    }
}*/

public enum ButtonStyle {
    case main
    case ghost
}

public struct HagerButtonModel{
    let title: String
    let style: ButtonStyle
}


public class HagerButton: UIButton{
    

    
    private var model: HagerButtonModel?
    
    init(with model: HagerButtonModel) {
        self.model = model
        super.init(frame: .zero)
        configure(with: model)
    }
    public override init(frame: CGRect) {
        self.model = nil
        super.init(frame: frame)
        
    }
    
    public func configure(with model: HagerButtonModel){
        self.model = model
        titleLabel?.text = model.title
        
        switch(model.style){
        case .ghost:
            self.backgroundColor = UIColor.white
            self.layer.borderWidth = 1
            self.layer.borderColor = HagerColors.mainOrange.cgColor
            
            titleLabel?.textColor = HagerColors.mainOrange
            
        case .main:
            self.backgroundColor = HagerColors.mainOrange
            
            titleLabel?.textColor = UIColor.white
        }
        
        if #available(iOS 13.0, *) {
            let hover = UIHoverGestureRecognizer(target: self, action: #selector(hovering(_:)))
            self.addGestureRecognizer(hover)
        } else {
            // Fallback on earlier versions
        }
        
        
        
    }
    @available(iOS 13.0, *)
    @objc
    func hovering(_ recognizer: UIHoverGestureRecognizer) {
        switch recognizer.state {
        case .began, .changed:
            
            if let style = model?.style{
                switch style {
                case .ghost:
                    self.backgroundColor = HagerColors.mainOrange
                    self.layer.borderWidth = 0
                    
                    titleLabel?.textColor = UIColor.white
                    
                case .main:
                    self.backgroundColor = HagerColors.hoverOrange
                    titleLabel?.textColor = UIColor.white
                }
            }
            
            self.titleLabel?.textColor = UIColor.link
        case .ended:
            
            if let style = model?.style{
                switch style {
                case .ghost:
                    self.backgroundColor = UIColor.white
                    self.layer.borderWidth = 1
                    self.layer.borderColor = HagerColors.mainOrange.cgColor
                    
                    titleLabel?.textColor = HagerColors.mainOrange
                    
                case .main:
                    self.backgroundColor = HagerColors.mainOrange
                    
                    titleLabel?.textColor = UIColor.white
                }
            }
            
        default:
            break
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

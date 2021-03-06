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
        
        self.setTitle(model.title, for: .normal)
        self.setTitleColor(UIColor.white, for: .normal)
        
        switch(model.style){
        case .ghost:
            self.backgroundColor = UIColor.white
            self.layer.borderWidth = 1
            self.layer.borderColor = HagerColors.mainOrange.cgColor
            self.setTitleColor(HagerColors.mainOrange, for: .normal)
            self.setTitleColor(UIColor.white, for: .highlighted)
            self.setTitleColor(HagerColors.hagerGreyE6, for: .disabled)
        case .main:
            self.backgroundColor = HagerColors.mainOrange
            
            self.setTitleColor(UIColor.white, for: .normal)
            self.setTitleColor(UIColor.white, for: .highlighted)
            self.setTitleColor(UIColor.white, for: .disabled)
        case .play:
            self.backgroundColor = HagerColors.mainOrange
            self.layer.cornerRadius = self.frame.size.height/2
            if #available(iOS 13.0, *) {
                self.setImage(UIImage(named: "play", in: .module, with: nil), for: .normal)
                self.setImage(UIImage(named: "play", in: .module, with: nil), for: .highlighted)
            } else {
                // Fallback on earlier versions
            }
            
        case .pause:
            self.backgroundColor = HagerColors.mainOrange
            self.layer.cornerRadius = self.frame.size.height/2
            if #available(iOS 13.0, *) {
                self.setImage(UIImage(named: "Pause", in: .module, with: nil), for: .normal)
                self.setImage(UIImage(named: "Pause", in: .module, with: nil), for: .highlighted)
            } else {
                // Fallback on earlier versions
            }
        case .add:
            self.backgroundColor = HagerColors.mainOrange
            self.layer.cornerRadius = self.frame.size.height/2
            if #available(iOS 13.0, *) {
                self.setImage(UIImage(named: "Path", in: .module, with: nil), for: .normal)
                self.setImage(UIImage(named: "Path", in: .module, with: nil), for: .highlighted)
            } else {
                // Fallback on earlier versions
            }
        }
        
        
    }
    
    override open var isHighlighted: Bool {
        didSet {
            
            if let style = model?.style{
                switch style {
                case .ghost:
                    backgroundColor = isHighlighted ? HagerColors.mainOrange : UIColor.white
                    self.layer.borderWidth = isHighlighted ? 0 : 1
                case .play:
                    backgroundColor = isHighlighted ? HagerColors.hoverOrange : HagerColors.mainOrange
                case .pause:
                    backgroundColor = isHighlighted ? HagerColors.hoverOrange : HagerColors.mainOrange
                case .add:
                    backgroundColor = isHighlighted ? HagerColors.hoverOrange : HagerColors.mainOrange
                    
                case .main:
                    self.backgroundColor = isHighlighted ? HagerColors.hoverOrange : HagerColors.mainOrange
                }
            }
        }
    }
    
    override open var isEnabled: Bool{
        didSet{
            if let style = model?.style{
                switch style {
                case .ghost:
                    backgroundColor = isEnabled ? UIColor.white : UIColor.white
                    self.layer.borderColor = isEnabled ? HagerColors.mainOrange.cgColor : HagerColors.hagerGreyE6.cgColor

                    
                case .main:
                    self.backgroundColor = isEnabled ? HagerColors.mainOrange : HagerColors.hagerGreyE6
                case .play:
                    self.backgroundColor = isEnabled ? HagerColors.mainOrange : HagerColors.hagerGreyE6
                case .pause:
                    self.backgroundColor = isEnabled ? HagerColors.mainOrange : HagerColors.hagerGreyE6
                case .add:
                    self.backgroundColor = isEnabled ? HagerColors.mainOrange : HagerColors.hagerGreyE6
                }
            }
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

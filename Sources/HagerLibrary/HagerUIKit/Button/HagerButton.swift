//
//  File.swift
//  
//
//  Created by Nassim Guettat on 26/04/2021.
//

import Foundation
import SwiftUI


@available(OSX 10.15.0, *)
struct HagerButton: View{
    var body: some View {
        Button {
            print("Image tapped!")
        } label: {
            Text("Button").font(.custom("Roboto Bold", size: 16)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.03).multilineTextAlignment(.center)
        }
    }
}

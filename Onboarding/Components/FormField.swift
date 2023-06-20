//
//  FormField.swift
//  Boss5207418
//
//  Created by Rachelle Ford on 6/16/23.
//

import SwiftUI

struct FormField: View {
    @Binding var value: String
    var icon: String
    var placeholder: String
    var isSecure = false
    
    
    var body: some View {
        Group{
            HStack{
                Image(systemName: icon).padding()
                Group{
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    }else {
                        TextField(placeholder, text: $value)
                    }
                    
                }.font(Font.system(size: 20, design: .rounded))
                    .foregroundColor(.gray)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.leading)
                    .autocapitalization(.none)
                
                
            }.overlay(RoundedRectangle(cornerRadius:
                10).stroke(Color.gray, lineWidth: 4)).padding()
        }
    }
}

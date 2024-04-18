//
//  UIComponents.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
//

import SwiftUI

struct BorderedTextField: View {
    @Binding private var text: String 
    let placeHolder: String
    
    public init(text: Binding<String>, placeHolder: String) {
            self._text = text
            self.placeHolder = placeHolder
        }
    var body: some View {
        TextField(placeHolder, text: $text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            )
            .padding(.horizontal) // Optional: Adjust horizontal padding
    }
}



struct StyledButton: View {
    var action:()->Void
    var text: String
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
                .fontWeight(.heavy)
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 150)
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                .clipShape(Capsule())
        }

    }
}

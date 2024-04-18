//
//  GettingStartedView.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
//

import SwiftUI

struct GettingStartedView: View {
    @State var data: Response?
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                NavigationLink {
                    SignUpPage()
                } label: {
                    Text("Getting Started")
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 150)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                        .clipShape(Capsule())
                }

//                Button {
//                    
//                } label: {
//                        
//                }
                NavigationLink {
                    
                } label: {
                        Text("Already An User? Sign In")
                            .fontWeight(.heavy)
                            .foregroundColor(.purple)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 150)
                            .background()
                        
                }
            }
        }
        .onAppear {
            requestTest { data in
                switch data {
                case .success(let data):
                    self.data = data
                    break
                case .failure(let error): 
                    break
                }
            
            }
        }
    }
}

#Preview {
    GettingStartedView()
}

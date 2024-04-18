//
//  SignUpPage.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
//

import SwiftUI

struct SignUpPage: View {
    @State private var email:String = ""
    @State private var name: String = ""
    @State private var dob: Date = {
        let now = Date()
        let calendar = Calendar.current
        let eighteenYearsAgo = calendar.date(byAdding: .year, value: -18, to: now) ?? now
        return eighteenYearsAgo
    }()
    @State private var isDatePickerVisible = false
    //    @State private var batch: String = ""
    var campus = [
        "Sector 62",
        "Sector 128"
    ]
    
    var gender = [
        "Female",
        "Male",
        "Other"
    ]
    
    @AppStorage("forVerifyName") var verifyName: String = ""
    @AppStorage("forVerifyBirthday") var verifyDate: String = ""
    @AppStorage("forVerifyCampus") var verifyCampus: String = ""
    @State private var selectedCampusIndex = 0
    @State private var selectedGenderIndex = 0
    @State var invalidEmailAlertShow: Bool = false
    var body: some View {
        ZStack {
            VStack {
                BorderedTextField(text: $name, placeHolder: "Your Name")
                
                VStack {
                    Picker("Select Gender", selection: $selectedGenderIndex) {
                        ForEach(0..<gender.count) { index in
                            Text(gender[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
//                    .padding()
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                }
                
                Button(action: {
                    withAnimation {
                        isDatePickerVisible.toggle()
                    }
                    
                }) {
                    HStack {
                        Image(systemName: "calendar")
                        Text("Select Birthday")
                    }
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                }
              
                
                if isDatePickerVisible {
                    DatePicker(selection: $dob, displayedComponents: .date) {
                        Text("Select Birthday")
                    }
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                }
                
                VStack {
                    Picker("Campus", selection: $selectedCampusIndex) {
                        ForEach(0..<campus.count) { index in
                            Text(campus[index]).tag(index)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
//                    .padding()
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 30)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    
                }
                
                BorderedTextField(text: $email, placeHolder: "Enter University Email")
                StyledButton(action: {
                    RequestOTP(email: email) { response in
                        
                        switch response {
                        case .success(let success):
                            if success.success == true {
                                print(success.message)
                                
                                verifyName = name
                                var dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "yyyy-MM-dd"
                                verifyDate = dateFormatter.string(from: dob)
                                verifyCampus = campus[selectedCampusIndex]
                            } else {
                                print(success.message)
                            }
                            
                        case .failure(let failure):
                            print("Request Error: \(failure.localizedDescription)")
                        }
                    }
                }, text: "Send OTP")
            }
            
            
        }
    }
}

#Preview {
    SignUpPage()
}

//
//  SignUpManager.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
//

import Foundation


func RequestOTP(email: String, completion: @escaping (Result<ResponseSignUpOTPRequest, Error>) -> Void){
    let url = api+"/RegisterEmail"
    let parsedURL = URL(string: url)
    
    var request = URLRequest(url: parsedURL!)
    request.httpMethod = "POST"
    
    
    
    
//    let payloadEmail = [
//        "email":
//        email
//    ]
    let payload = RequestOTPStruct(email: email)
    do {
//        let jsonEncode = try JSONSerialization.data(withJSONObject: payloadEmail)
        let jsonEncode = try JSONEncoder().encode(payload)
        request.httpBody = jsonEncode
        
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        URLSession.shared.dataTask(with: request){data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            do {
                
                if let data = data {
                    let response = try JSONDecoder().decode(ResponseSignUpOTPRequest.self, from: data)
                    completion(.success(response))
                }
            } catch {
                
            }
        }.resume()
    }
    catch {
        
    }
    
}


struct RequestOTPStruct: Codable {
    let email: String
}

func isValidEmail(_ email: String) -> Bool {
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

    let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailPred.evaluate(with: email)
}

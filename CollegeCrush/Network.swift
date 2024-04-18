//
//  Network.swift
//  CollegeCrush
//
//  Created by Anshumali Karna on 18/04/24.
//

import Foundation



 func requestTest(completion: @escaping (Result<Response, Error>) -> Void){
    let url = api+"/test"
    guard let parsedURL = URL(string: url) else { return }
    
     var request = URLRequest(url: parsedURL)
    
     request.httpMethod = "GET"
     
    URLSession.shared.dataTask(with: request){ data, response, error  in
        if let error = error {
            print("\(error.localizedDescription)")
            completion(.failure(error))
        }
        
        guard let data = data else {
            print("No Data Found")
            return
        }
        
        do {
            let decodableData = try JSONDecoder().decode(Response.self, from: data)
            print(decodableData)
            completion(.success(decodableData))
        } catch {
            print("Error")
        }
    }.resume()
     
    
}

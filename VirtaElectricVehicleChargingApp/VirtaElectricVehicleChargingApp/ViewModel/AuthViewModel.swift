//
//  AuthViewModel.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 18/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import UIKit

class AuthViewModel {
    
    var auth : AuthModel?
    
    var isLoading: Bool = false {
        didSet {
            showLoading?()
        }
    }
    var showLoading: (() -> Void)?
    
    var goToHome: (() -> Void)?
    
    var inValidLogin: (() -> Void)?

    func doLogin(username: String, password: String)  {
        let parameters: [String: Any] = [
            "email": username,
            "code": password
        ]
        login(_with: parameters)
    }
    
    func login(_with parameters:[String: Any]) {
        
        self.isLoading = true
        
        let url = URL(string: "https://apitest.virta.fi/v4/auth")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = parameters.jsonStringRepresentation
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                        
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let auth = try decoder.decode(AuthModel.self, from: data)
                if (auth.access_token != nil) {
                    self.auth = auth
                    let defaults =  UserDefaults.standard
                    defaults.set(auth.access_token, forKey: "accessToken")
                    self.goToHome?()
                } else {
                    self.inValidLogin?()
                }
            } catch {
                print(error.localizedDescription)
            }
            self.isLoading = false
        }
        task.resume()
    }
}

extension Dictionary {
    var jsonStringRepresentation: Data? {
        guard let theJSONData = try? JSONSerialization.data(withJSONObject: self,
                                                            options: [.prettyPrinted]) else {
                                                                return nil
        }
        return theJSONData
    }
}

//
//  StationDetailViewModel.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 19/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import Foundation

class StationDetailViewModel {
    
    var stationModel : StationModel?

    var reloadVC: (() -> Void)?

    func fetchStationDetail(_with Id:Int) {
                
        let url = URL(string: "https://apitest.virta.fi/v4/stations/\(Id)")
        guard let requestUrl = url else { fatalError() }
        
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "GET"
        
        //access token
        let defaults = UserDefaults.standard
        let authorization = "bearer " + (defaults.string(forKey: "accessToken") ?? "")
        
        // Set HTTP Request Header
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue(authorization, forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let error = error {
                print("Error took place \(error)")
                return
            }
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            
            do {
                let stationModel = try decoder.decode(StationModel.self, from: data)
                self.stationModel = stationModel
                self.reloadVC?()
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

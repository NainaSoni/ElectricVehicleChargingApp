//
//  StationsViewModel.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 19/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import Foundation

class StationsViewModel {
    
    var arrStations = [StationModel]()
    
    var reloadTable: (() -> Void)?
    
    func fecthStationList() {
        let url = URL(string: "https://apitest.virta.fi/v4/stations")
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
                let response = try decoder.decode([StationModel].self, from: data)
                self.arrStations.append(contentsOf: response)
                self.reloadTable?()
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

//
//  StationDetailViewController.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 18/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import UIKit

class StationDetailViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = StationDetailViewModel()
    var stationId : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Station Detail"
        self.activityIndicator.startAnimating()
        
        viewModel.fetchStationDetail(_with: stationId)
        
        viewModel.reloadVC = {
            DispatchQueue.main.async {
                
                self.activityIndicator.isHidden = true;
                self.activityIndicator.stopAnimating()
                
                self.name.text = self.viewModel.stationModel?.name
                self.address.text = self.viewModel.stationModel?.address
            }
        }
    }
}

extension UINavigationItem {
    var textAttributes: [NSAttributedString.Key : Any]? {
        let theTextAttribute = [NSAttributedString.Key.foregroundColor:UIColor(red: 105.0/255.0, green: 120.0/255.0, blue: 135.0/255.0, alpha: 1)]
        return theTextAttribute
    }
}

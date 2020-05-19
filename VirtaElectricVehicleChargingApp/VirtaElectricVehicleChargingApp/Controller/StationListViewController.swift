//
//  StationListViewController.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 18/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import UIKit

class StationListViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var viewModel = StationsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationItem.title = "Nearby"
        self.navigationItem.hidesBackButton = true
        
        self.activityIndicator.startAnimating()
        viewModel.fecthStationList()
        tblView.dataSource = self
        tblView.delegate = self
        tblView.register(UINib(nibName: "StationCell", bundle: nil), forCellReuseIdentifier: "StationCell")
        viewModel.reloadTable = {
            DispatchQueue.main.async {
                self.activityIndicator.isHidden = true;
                self.activityIndicator.stopAnimating()
                self.tblView.reloadData()
            }
        }
    }
    
}

extension StationListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.arrStations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StationCell", for: indexPath) as? StationCell
        let stationModel = viewModel.arrStations[indexPath.row]
        cell?.name.text = stationModel.name
        cell?.address.text = stationModel.address
        return cell!
    }
}

extension StationListViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stationModel = viewModel.arrStations[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "StationDetailViewController") as! StationDetailViewController
        vc.stationId = stationModel.id ?? 0
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

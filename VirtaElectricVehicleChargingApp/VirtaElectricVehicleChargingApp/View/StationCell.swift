//
//  StationCell.swift
//  VirtaElectricVehicleChargingApp
//
//  Created by Naina Soni on 19/05/2020.
//  Copyright © 2020 Naina Soni. All rights reserved.
//

import UIKit

class StationCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var address: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    setConnectors(connector: [Connectors]) {
//
//    }
    
}

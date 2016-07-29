//
//  SpotInfoCell.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/29/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit

class SpotInfoCell: UITableViewCell {
    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func drawRect(rect: CGRect) {
        print("drawing the cell")
    }
    
    func configureSpotInfo(spot: Spot){
        
        if let name = spot.spotName as? String {
            self.spotNameLabel.text = name
        }
        
        if let url = spot.mgswUrl as? String {
            self.windSpeedLabel.text = url
        }
    }
}

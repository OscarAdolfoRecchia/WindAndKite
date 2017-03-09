//
//  SpotCell.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/3/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit

class SpotCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImage!
    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImage!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(_ spot: Spot){
        self.spotNameLabel.text = spot.spotName
    }
}

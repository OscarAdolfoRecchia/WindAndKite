//
//  SpotInfoCell.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/29/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

let WEATHER_BASE_URL = "https://api.worldweatheronline.com/premium/v1/weather.ashx?num_of_days=2&tp=3&format=JSON"


class SpotInfoView: UIView {
    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var timeAndDateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    override func drawRect(rect: CGRect) {
        print("drawing the cell")
    }
    
    func configureSpotInfo(spot: Spot){
        
        if let name = spot.spotName as? String {
            self.spotNameLabel.text = name
        }
        
        Alamofire.request(.GET, WEATHER_BASE_URL, parameters: ["q":"\(spot.lat),\(spot.long)", "key" : WEATHER_API_KEY]).responseJSON { response in
            
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                    
                    let currentConditions = json["data"]["current_condition"]
                    print("current conditions = \(currentConditions)")
                
                    let currentWind = json["data"]["current_condition"][0]["windspeedKmph"]
                    //self.windSpeedLabel.text = currentWind.string
                    print("Current wind speed is \(currentWind)")
                    
                    //self.weatherDescriptionLabel.text = json["data"]["current_condition"][0]["weatherDesc"][0]["value"].string
                    
                    self.timeAndDateLabel.text = NSDateFormatter.localizedStringFromDate(NSDate(), dateStyle: .MediumStyle, timeStyle: .ShortStyle)
                }
            case .Failure(let error):
                print(error)
            }
            
            //            if let JSONParse = response.result.value{
//                print("Json of the response is \(JSONParse)")
//                
//                let json = JSON(data:response.result)
//                let json = JSON["data"]!["current_condition"]!.string
//                print("parsed yeah = \(json)")
//                
//            }
        }
    }
}

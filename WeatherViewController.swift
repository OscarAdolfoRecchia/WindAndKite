//
//  WeatherViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/4/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class WeatherViewController: UIViewController{
    
    @IBOutlet weak var spotNameLabel: UILabel!
    @IBOutlet weak var windSpeedLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var timeAndDateLabel: UILabel!
    @IBOutlet weak var windDirectionLabel: UILabel!
    @IBOutlet weak var pressureLabel:UILabel!
    @IBOutlet weak var humidityLabel:UILabel!
    @IBOutlet weak var temperatureLabel:UILabel!
    
    @IBOutlet weak var windLabel1: UILabel!
    @IBOutlet weak var windLabel2: UILabel!
    @IBOutlet weak var windLabel3: UILabel!
    @IBOutlet weak var windLabel4: UILabel!
    @IBOutlet weak var windLabel5: UILabel!


    
    @IBOutlet weak var windScoller:UIScrollView!
    
    var spot: Spot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        configureSpotInfo(self.spot)
        
    }
    
    func configureSpotInfo(_ spot: Spot){
        
        if let name = spot.spotName as? String {
            self.spotNameLabel.text = name
        }
        
        Alamofire.request(.GET, WEATHER_BASE_URL, parameters: ["q":"\(spot.lat),\(spot.long)", "key" : WEATHER_API_KEY]).responseJSON { response in
            
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print("JSON: \(json)")
                    
                    let currentConditions = json["data"]["current_condition"]
                    print("current conditions = \(currentConditions)")
                    
                    let currentWind = json["data"]["current_condition"][0]["windspeedKmph"]
                    self.windSpeedLabel.text = currentWind.string
                    print("Current wind speed is \(currentWind)")
                    
                    self.weatherDescriptionLabel.text = json["data"]["current_condition"][0]["weatherDesc"][0]["value"].string
                    
                    self.timeAndDateLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .short)
                    
                    let currentTemp = json["data"]["current_condition"][0]["temp_C"]
                    self.temperatureLabel.text = currentTemp.string
                    
                    let currentHumidity = json["data"]["current_condition"][0]["humidity"]
                    self.humidityLabel.text = currentHumidity.string
                    
                    let currentPressure = json["data"]["current_condition"][0]["pressure"]
                    self.pressureLabel.text = currentPressure.string
                    
                    let windDirection = json["data"]["current_condition"][0]["winddir16Point"]
                    self.windDirectionLabel.text = windDirection.string
                
                    
                    
                    
                    
                    
                    //sort out wind and time labels, this is lazy
                    let windDirection9 = json["data"]["weather"][0]["hourly"][3]["windspeedKmph"]
                    self.windLabel1.text = windDirection9.string
                
                    let windDirection12 = json["data"]["weather"][0]["hourly"][4]["windspeedKmph"]
                    self.windLabel2.text = windDirection12.string
                    
                    let windDirection15 = json["data"]["weather"][0]["hourly"][5]["windspeedKmph"]
                    self.windLabel3.text = windDirection15.string
                    
                    let windDirection18 = json["data"]["weather"][0]["hourly"][6]["windspeedKmph"]
                    self.windLabel4.text = windDirection18.string
                    
                    let windDirection21 = json["data"]["weather"][0]["hourly"][7]["windspeedKmph"]
                    self.windLabel5.text = windDirection21.string
                    
                    
                    
                    
                    
                }
            case .failure(let error):
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

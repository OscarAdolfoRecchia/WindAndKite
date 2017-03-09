//
//  Spot.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/29/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import Foundation


class Spot{
    
    fileprivate var _spotKey: String!
    fileprivate var _spotName: String!
    fileprivate var _mgswUrl: String!
    fileprivate var _long: String!
    fileprivate var _lat: String!
    fileprivate var _hasWebCam: Bool!
    fileprivate var _webCamURL: String?
    fileprivate var _mgswWidget1URL: String?
    fileprivate var _mgswWidget2URL: String?
    
//    private var _imgUrl: String?
//    private var _posts: [String]!
//    
//    internal var waves: String?
//    internal var wind: String?
    
   
    //public accessors for private variables
    var spotName: String {
        return _spotName
    }
    
    var mgswUrl: String{
        return _mgswUrl
    }
    
    var long: String{
        return _long
    }
    
    var lat: String{
        return _lat
    }
    
    var hasWebCam: Bool{
        return _hasWebCam
    }
    
    var webCamURL: String{
        return _webCamURL!
    }
    
    var mgswWidget1URL: String{
        return _mgswWidget1URL!
    }
    
    var mgswWidget2URL: String{
        return _mgswWidget2URL!
    }
    
    
//    var imgUrl: String{
//        return _imgUrl!
//    }
    
    //init on the client side
    init(name: String, mgswUrl: String){
        self._spotName = name
        self._mgswUrl = mgswUrl
    }
    
    //getting a spot from the server and parsing the data
    init(spotKey: String, spotData: Dictionary<String, AnyObject>){
        self._spotKey = spotKey
        
        if let name =  spotData["Name"] as? String {
            self._spotName = name
        }
        
        if let mgswUrl = spotData["url"] as? String {
            self._mgswUrl = mgswUrl
        }
        
        if let latitude = spotData["lat"] as? String {
            self._lat = latitude
        }
        
        if let longitude = spotData["long"] as? String {
            self._long = longitude
        }
        
        if let hasWebCam = spotData["hasWebCam"] as? String {
            if(hasWebCam == "true"){
                self._hasWebCam = true
                if let camURL = spotData["webCamURL"] as? String {
                    self._webCamURL = camURL
                }
            }else{
                self._hasWebCam = false
            }
           
        }
        
        if let widget1URL = spotData["magicWidget1"] as? String{
            self._mgswWidget1URL = widget1URL
        }
        
        if let widget2URL = spotData["magicWidget2"] as? String{
            self._mgswWidget2URL = widget2URL
        }
    }
    
    
}

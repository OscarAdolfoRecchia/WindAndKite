//
//  Spot.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/29/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import Foundation


class Spot{
    
    private var _spotKey: String!
    private var _spotName: String!
    private var _mgswUrl: String!
    private var _long: String!
    private var _lat: String!
    
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
    }
    
    
}
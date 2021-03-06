//
//  User.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/8/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import Foundation


class User{

    fileprivate var _firstName: String!
    fileprivate var _lastName: String!
    fileprivate var _loginType: String!
    fileprivate var _picURL: String!
//    private var _uid: String!
    
    
    var firstName: String {
        return _firstName
    }
    
    var lastName: String {
        return _lastName
    }
    
    var loginType: String {
        return _loginType
    }
    
    var picURL: String {
        return _picURL
    }
    
//    var uid: String {
//        return _uid
//    }
    

    init(firstName: String!, lastName: String!, provider: String!, picURL: String!){
        self._firstName = firstName
        self._lastName = lastName
        self._loginType = provider
        self._picURL = picURL
//        self._uid = uids
    }
}

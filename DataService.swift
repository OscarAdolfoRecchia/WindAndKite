//
//  DataService.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/21/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import Foundation
import Firebase

let URL_BASE = "https://kite-loop.firebaseio.com/"

class DataService{
    static let ds = DataService()

    fileprivate var _REF_BASE = Firebase(url:"\(URL_BASE)")
    fileprivate var _REF_POSTS = Firebase(url:"\(URL_BASE)/posts")
    fileprivate var _REF_USERS = Firebase(url:"\(URL_BASE)/users")
    fileprivate var _REF_SPOTS = Firebase(url:"\(URL_BASE)/spots")
    
    var REF_BASE: Firebase {
        return _REF_BASE!
    }
    
    var REF_POSTS: Firebase {
        return _REF_POSTS!
    }
    
    var REF_USERS: Firebase {
        return _REF_USERS!
    }
    
    var REF_SPOTS: Firebase {
        return _REF_SPOTS!
    }
    
    func createFireBaseUser(_ uid:String, user: Dictionary<String,String>){
        REF_USERS.child(byAppendingPath: uid).setValue(user)
        
    }
    
}

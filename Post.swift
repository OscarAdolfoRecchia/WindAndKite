//
//  Post.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/22/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import Foundation

class Post{
    private var _postDescription: String!
    private var _imageUrl: String?
//    private var _likes: Int!
    private var _username: String!
    private var _postKey: String!
    private var _spot: String!
    private var _profileImage: String!
    
    var postDescription: String {
        return _postDescription
    }
    
    var imageUrl: String? {
        return _imageUrl
    }
    
//    var likes: Int {
//        return _likes
//    }
    
    var username: String {
        return _username
    }
    
    var spot: String {
        return _spot
    }
    
    var profileImage: String{
        return _profileImage
    }
    
    init(description: String, imageUrl: String?, username: String, spot: String, profileImage: String!){
        self._postDescription = description
        self._imageUrl = imageUrl
        self._username = username
        self._spot = spot
        self._profileImage = profileImage
    }
    
    init(postKey: String, dictionary: Dictionary<String, AnyObject>){
        self._postKey = postKey
        
//        if let likes = dictionary["likes"] as? Int {
//            self._likes = likes
//        }
        
        if let imgUrl = dictionary["imageUrl"] as? String {
            self._imageUrl = imgUrl
        }
        
        if let desc = dictionary["description"] as? String {
            self._postDescription = desc
        }
        
        if let username = dictionary["username"] as? String {
            self._username = username
        }
        
        if let spot = dictionary["spot"] as? String {
            self._spot = spot
        }
        
        if let profileImage = dictionary["profileImage"] as? String {
            self._profileImage = profileImage
        }
    }
}

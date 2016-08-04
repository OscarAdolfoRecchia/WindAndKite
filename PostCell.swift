//
//  PostCell.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/22/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import Alamofire

class PostCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var showCaseImg: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    var request: Request?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }
    
    override func drawRect(rect: CGRect) {
        profileImg.layer.cornerRadius = profileImg.frame.size.width/2
        profileImg.clipsToBounds = true
        
        showCaseImg.clipsToBounds = true
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func configureCell(post: Post, image: UIImage?){
        self.post = post
        self.descriptionText.text = post.postDescription
        
        self.likesLbl.text = "\(post.likes)"
        
        if(post.imageUrl != nil){
            if(image != nil){
                self.showCaseImg.image = image
            }else{
                request = Alamofire.request(.GET, post.imageUrl!).validate(contentType:["image/*"]).response(completionHandler: {request, response, data, err in
                    
                    if(err == nil){
                        let img = UIImage(data:data!)!
                        self.showCaseImg.image = img
                        Feedvc.imageCache.setObject(img, forKey: self.post.imageUrl!)
                        
                    }
                })
            }
        }else{
           self.showCaseImg.hidden = true
        }
        
    }
}

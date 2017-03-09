//
//  MagicSeaweedView.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/3/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit

class MagicSeaweedView: UIView, UIWebViewDelegate {
    
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var mgswButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var widgetView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.widgetView = UIWebView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        let localfilePath = Bundle.main.url(forResource: "MagicSeaweed", withExtension: "html");
        let myRequest = URLRequest(url: localfilePath!);
        self.widgetView.loadRequest(myRequest);
        self.widgetView.delegate = self
        self.addSubview(self.widgetView)
//        
//        let webV:UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//        webV.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.jogendra.com")))
//        webV.delegate = self;
//        self.view.addSubview(webV)
        
        self.widgetView.isHidden = true
    }
    
    @IBAction func expandAndShow(_ sender: AnyObject){
        self.heightConstraint.constant = UIScreen.main.bounds.height
  
        self.widgetView.isHidden = false
    }
    
    
    
}

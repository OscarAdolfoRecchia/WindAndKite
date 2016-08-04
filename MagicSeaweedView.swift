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
    
    var widgetView: UIWebView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.widgetView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        let localfilePath = NSBundle.mainBundle().URLForResource("MagicSeaweed", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        self.widgetView.loadRequest(myRequest);
        self.widgetView.delegate = self
        self.addSubview(self.widgetView)
//        
//        let webV:UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
//        webV.loadRequest(NSURLRequest(URL: NSURL(string: "http://www.jogendra.com")))
//        webV.delegate = self;
//        self.view.addSubview(webV)
        
        self.widgetView.hidden = true
    }
    
    @IBAction func expandAndShow(sender: AnyObject){
        self.heightConstraint.constant = UIScreen.mainScreen().bounds.height
        self.widgetView.hidden = false
    }
    
    
    
}
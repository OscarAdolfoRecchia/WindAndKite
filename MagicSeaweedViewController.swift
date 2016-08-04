//
//  MagicSeaweedViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/3/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit

class MagicSeaweedViewController: UIViewController {

  
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let widgetView1:UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        let widgetView2:UIWebView = UIWebView(frame: CGRectMake(UIScreen.mainScreen().bounds.width, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        
        
        
        
        let localfilePath = NSBundle.mainBundle().URLForResource("MagicSeaweed", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        widgetView1.loadRequest(myRequest);
        

//        let url = NSURL (string: "https://www.windguru.cz/int/index.php?sc=47721&sty=m_spot");
//        let requestObj = NSURLRequest(URL: url!);
//        widgetView.loadRequest(requestObj);
        let localfilePath2 = NSBundle.mainBundle().URLForResource("MagicSeaweed2", withExtension: "html");
        let myRequest2 = NSURLRequest(URL: localfilePath2!);
        widgetView2.loadRequest(myRequest2);
        
        self.scrollView.pagingEnabled = true
        self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width * 2, UIScreen.mainScreen().bounds.height - 200)
        self.scrollView.pagingEnabled = true
        self.scrollView.addSubview(widgetView1)
        self.scrollView.addSubview(widgetView2)
    
    }

    
}

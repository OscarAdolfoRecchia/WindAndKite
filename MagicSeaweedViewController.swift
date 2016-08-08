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
    var spot:Spot!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        let widgetView1:UIWebView = UIWebView(frame: CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        let widgetView2:UIWebView = UIWebView(frame: CGRectMake(UIScreen.mainScreen().bounds.width, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height))
        
        
        //load in html for 1 widget
        widgetView1.loadHTMLString("<html><head></head><body><div style=\"width:400px;background:#fff\"><script type=\"text/javascript\" src=\"http://magicseaweed.com/syndicate/index.php?\(self.spot.mgswWidget1URL)\"></script><p><div style=\"font-family:Arial, Helvetica, sans-serif;text-align:center;font-size:10px;color:#000;height:25px;\"><a href=\"http://magicseaweed.com/Strandhill-Surf-Report/51/\" style=\"color:#000;\">Strandhill Surf Report and Forecast</a></div></p></div></body></html>", baseURL: nil)

        //load in html for second widget
        widgetView2.loadHTMLString("<html><head></head><body><div style=\"width:400px;background:#fff\"><script type=\"text/javascript\" src=\"http://magicseaweed.com/syndicate/index.php?\(self.spot.mgswWidget2URL)\"></script><p><div style=\"font-family:Arial, Helvetica, sans-serif;text-align:center;font-size:10px;color:#000;height:25px;\"><a href=\"http://magicseaweed.com/Strandhill-Surf-Report/51/\" style=\"color:#000;\">Strandhill Surf Report and Forecast</a></div></p></div></body></html>", baseURL: nil)
        
        self.scrollView.pagingEnabled = true
        self.scrollView.contentSize = CGSizeMake(UIScreen.mainScreen().bounds.width * 2, UIScreen.mainScreen().bounds.height - 200)
        self.scrollView.pagingEnabled = true
        self.scrollView.addSubview(widgetView1)
        self.scrollView.addSubview(widgetView2)
    
    }

    
}

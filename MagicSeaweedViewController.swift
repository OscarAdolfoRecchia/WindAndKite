//
//  MagicSeaweedViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/3/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit

class MagicSeaweedViewController: UIViewController {

    @IBOutlet  weak var widgetView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let localfilePath = NSBundle.mainBundle().URLForResource("MagicSeaweed", withExtension: "html");
        let myRequest = NSURLRequest(URL: localfilePath!);
        self.widgetView.loadRequest(myRequest);

//        let url = NSURL (string: "https://www.windguru.cz/int/index.php?sc=47721&sty=m_spot");
//        let requestObj = NSURLRequest(URL: url!);
//        widgetView.loadRequest(requestObj);
        
    }

    
}

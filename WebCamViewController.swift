//
//  WebCamViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/5/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit

class WebCamViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    var spot:Spot!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let url = NSURL (string: spot.webCamURL);
        let requestObj = NSURLRequest(URL: url!);
        self.webView.loadRequest(requestObj);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

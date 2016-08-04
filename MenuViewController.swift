//
//  MenuViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 7/29/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var spots = [Spot]()
   
    @IBOutlet weak var tableView: UITableView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
  
       
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spots.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        
        
            return MenuCell()
     
        
      
    }
}

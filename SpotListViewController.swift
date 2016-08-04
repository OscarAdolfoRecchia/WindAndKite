//
//  SpotListViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/3/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import Firebase
import Alamofire

class SpotListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var detailViewController: ScrollViewController? = nil
    private var spots = [Spot]()
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        if let split = self.splitViewController {
            let controllers = split.viewControllers
            self.detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? ScrollViewController
        }
        
        
        DataService.ds.REF_SPOTS.observeSingleEventOfType(.Value, withBlock: { snapshot in
            
            print(snapshot.value)
            if let snapshots = snapshot.children.allObjects as? [FDataSnapshot]{
                
                for snap in snapshots {
                    print("SNAP \(snap)")
                    
                    if let postDict = snap.value as? Dictionary<String, AnyObject>{
                        let key = snap.key
                        let spot = Spot(spotKey: key, spotData: postDict)
                        self.spots.append(spot)
                    }
                }
                
                self.tableView.reloadData()
                
            }
        })
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return spots.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let spot = spots[indexPath.row]
        print(spot.spotName)
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("SpotCell") as? SpotCell{
            
            cell.configureCell(spot)
            return cell
        }else{
            return SpotCell()
        }
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("SpotCell", forIndexPath: indexPath) as? SpotCell
        return cell!
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
//                let spot = spots[indexPath.row] 
//                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! Feedvc
//                controller.spot = spot
//                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                //controller.navigationItem.leftItemsSupplementBackButton = true
                
            }
        }
    }
}

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
        
        let backgroundImage = UIImage(named: "rainy-wallpaper")
        let imageView = UIImageView(image:backgroundImage)
        imageView.frame = self.tableView.frame
        self.tableView.backgroundView = imageView
        
        
        
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
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator;

            return cell
        }else{
            return SpotCell()
        }
        
        
//        
//        let cell = tableView.dequeueReusableCellWithIdentifier("SpotCell", forIndexPath: indexPath) as? SpotCell
//        return cell!
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let spot = self.spots[indexPath.row]

                let tabBarController = (segue.destinationViewController as! UINavigationController).topViewController as! UITabBarController
                
                
                //set data for the weather view
                let nav = tabBarController.viewControllers![0] as! UINavigationController
                let weatherViewController = nav.topViewController as! WeatherViewController
                weatherViewController.spot = spot
                tabBarController.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                tabBarController.navigationItem.leftItemsSupplementBackButton = true
                


                
                //set data for magic seaweed view
                let nav2 = tabBarController.viewControllers![1] as! UINavigationController
                let magicViewController = nav2.topViewController as! MagicSeaweedViewController
                magicViewController.spot = spot
                
                //set data for
                let nav3 = tabBarController.viewControllers![2] as! UINavigationController
                let feedViewController = nav3.topViewController as! Feedvc
                feedViewController.spot = spot
                
                //set data for map view
                let nav4 = tabBarController.viewControllers![3] as! UINavigationController
                let mapViewController = nav4.topViewController as! MapViewController
                mapViewController.spot = spot
                
                //set data for webcam view
                if(spot.hasWebCam){
                    //set data for webcam view
                    let nav5 = tabBarController.viewControllers![4] as! UINavigationController
                    let webCamViewController = nav5.topViewController as! WebCamViewController
                    webCamViewController.spot = spot
                }else{
                    tabBarController.viewControllers?.removeAtIndex(4)
                }
            
                
            }
        }
    }
}

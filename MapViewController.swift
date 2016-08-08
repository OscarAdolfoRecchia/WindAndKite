//
//  MapViewController.swift
//  Kite Loop
//
//  Created by Patrick Monahan on 8/5/16.
//  Copyright © 2016 makadaapp. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    weak var spot:Spot!
    let regionRadius: CLLocationDistance = 2000
    
    override func viewDidLoad() {
        super.viewDidLoad()


        let initialLocation = CLLocation(latitude: (spot.lat as NSString).doubleValue, longitude: (spot.long as NSString).doubleValue)
        centerMapOnLocation(initialLocation)
        
        var latDelta:CLLocationDegrees = 0.01
        
        var longDelta:CLLocationDegrees = 0.01
        
        var theSpan:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var pointLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(
        initialLocation.coordinate.latitude, initialLocation.coordinate.longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(pointLocation, theSpan)
        mapView.setRegion(region, animated: true)
        
        var pinLocation : CLLocationCoordinate2D = CLLocationCoordinate2DMake(initialLocation.coordinate.latitude, initialLocation.coordinate.longitude)
        var objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = pinLocation
        objectAnnotation.title = self.spot.spotName
        
        self.mapView.mapType = MKMapType.Satellite
        self.mapView.addAnnotation(objectAnnotation)
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
    // set initial location in Honolulu
    
    
    
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
}

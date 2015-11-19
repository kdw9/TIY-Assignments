//
//  ViewController.swift
//  TheMuttCutts
//
//  Created by Keron Williams on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


protocol PopOverTextViewControllerProtocol
{
    func didReceivePopOverResults(results: String)
}

class MapViewController: UIViewController, UIPopoverPresentationControllerDelegate, PopOverTextViewControllerProtocol
{
    @IBOutlet weak var mapView: MKMapView!
    
    var twoCitesAndStates = Array<MKPointAnnotation>()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
//(.6) *** Add Geocode (give a street adress)
        self.destinationAnnotation("Orlando, Fl")
        self.destinationAnnotation("New York, Ny")
        
//(.1) *** First thing is to create a location
        //let cityState = CLLocationCoordinate2DMake(28.540923, -81.38216)
        
//(.2) *** An annotation is the little pin with the red dot on there
        //let tiyAnnotation = MKPointAnnotation()
        //tiyOrlandoAnnotation.coordinate = tiyOrlando
        
//(3.) *** Add titles and subtitle
       // tiyOrlandoAnnotation.title = "The Iron Yard"
       // tiyOrlandoAnnotation.subtitle = "Orlando"
        
        ////////// -- 2nd Location -- ///////////
        //let tiyTampa = CLLocationCoordinate2DMake(27.770068, -82.63642)
        //let tiyTampaAnnotation = MKPointAnnotation()
        //tiyTampaAnnotation.coordinate = tiyTampa
        //tiyTampaAnnotation.title = "The Iron Yard"
        //tiyTampaAnnotation.subtitle = "Tampa"
        
      //  let annotations = [pointAAnnotation, pointBAnnotation]
        
//(4a.) These Mapviews controls how we view the map. the "*=" means we soom out x2 or whatever the number is.
       // mapView.addAnnotations(annotations)
        
       // mapView.camera.altitude *= 2
        
//(.4) *** Now that we've add the annotation to the screen we want to set the region (how much of the map we want to show)
        
//        let viewRegion = MKCoordinateRegionMakeWithDistance(tiyOrlando, 2000, 2000)
//        mapView.setRegion(viewRegion, animated: true)
        
        //let orlandoLocation = CLLocation(coordinate: tiyOrlando, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        //let tampaLocation = CLLocation (coordinate: tiyTampa, altitude: 0, horizontalAccuracy: 0, verticalAccuracy: 0, timestamp: NSDate())
        //let lineOfSightDistance = orlandoLocation.distanceFromLocation(tampaLocation)
        //print("distance between \(tiyOrlandoAnnotation.subtitle!) and \(tiyTampaAnnotation.subtitle!): " + String(format: "%.2f", lineOfSightDistance * 0.00062137) + " miles")
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        func destinationAnnotation(cityString: String)
        {
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(cityString, completionHandler: {(placemarks: [CLPlacemark]?,error: NSError?) -> Void in
                if let placemark = placemarks?[0]
                {
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = (placemark.location?.coordinate)!
                    annotation.title = cityString
                    self.twoCitesAndStates.append(annotation)
                    self.mapView.addAnnotations(self.twoCitesAndStates)
                    
                }
            })
          
        mapView.showAnnotations(twoCitesAndStates, animated: true)
        }
        
        
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
   {
        if segue.identifier == "ShowPopOverSegue"
       {
            let destVC = segue.destinationViewController as! PopOverTextViewController
            destVC.popoverPresentationController?.delegate = self
          destVC.preferredContentSize = CGSizeMake(200.0, 100.0)
        
       }
    }
  
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .None
    }
// MARK: - Pop Over VC Protocol
    func didReceivePopOverResults(results: String)
    {
        print("My City")
    }
    
}


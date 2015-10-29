//
//  ViewController.swift
//  MuttCutts
//
//  Created by Keron Williams on 10/28/15.
//  Copyright © 2015 The Iron Yard. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController
{
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let tiyOrlando = CLLocationCoordiante2DMake(28.540923, -81.38216)
        let tiyOrlandoAnnotation.coordinate = tiyOrlando
        tiyOrlandoAnnotation.coordinate = tiyOrlando
        tiyOrlandoAnnotation.title = "The Iron Yard"
        tiyOrlandoAnnotation.subtitle = "Orlando"
        
        let annotations = [tiyOrlandoAnnotation]
        mapView.addAnnotation(annotations)
        
        let viewRegion = MKCoodinateRegionMakeWithDistance
        (tiyOrlando, 2000, 2000)
        mapView.setRegion(viewRegion, animate: true)
        
        let tiyTampa = CLLocationCoordiante2DMake(27.770068, -82.63642)
        let tiyTampaAnnotation.coordinate = tiyOrlando
        tiyTampaAnnotation.coordinate = tiyOrlando
        tiyTampaAnnotation.title = "The Iron Yard"
        tiyTampaAnnotation.subtitle = "Tampa"
        
        let annotations = [tiyTampaAnnotation]
        mapView.addAnnotation(annotations)
        mapView.showAnnotations(annotations,animate)
        
        //let viewRegion = MKCoodinateRegionMakeWithDistance
        (tiyTampa, 2000, 2000)
        mapView.setRegion(viewRegion, animate: true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


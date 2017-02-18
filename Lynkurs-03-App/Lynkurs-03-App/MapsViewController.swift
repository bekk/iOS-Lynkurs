//
//  MapsViewController.swift
//  Lynkurs-03-App
//
//  Created by Fredrik Lillejordet on 17.02.2017.
//  Copyright © 2017 Bekk Consulting AS. All rights reserved.
//

import UIKit
import MapKit

class MapsViewController : UIViewController, MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        self.title = "Maps"
        placeAnnotations()
    }
        
    func placeAnnotations(){
        var markers : [MKPointAnnotation] = []
        
        markers.append(createAnnotation(name: "BEKK - Oslo", long: 10.7369906, lat: 59.9037048))
        markers.append(createAnnotation(name: "BEKK - Trondheim", long: 10.4054215, lat: 63.4329693))
        markers.append(createAnnotation(name: "NTNU - Trondheim", long: 10.3998883, lat: 63.4195014))
        
        mapView.addAnnotations(markers)
    }
    
    func createAnnotation(name: String, long: Double, lat: Double) -> MKPointAnnotation{
        let annotation = MKPointAnnotation()
        annotation.title = name
        annotation.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
        return annotation
    }
    
}

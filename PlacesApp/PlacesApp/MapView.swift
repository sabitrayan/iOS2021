//
//  MapView.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//

import Foundation
import SwiftUI
import MapKit

class Coordinator: NSObject, MKMapViewDelegate{
    var control: MapView
    
    init(_ control: MapView){
        self.control = control
    }
    
    @objc func addPinBasedOnGesture(_ gestureRecognizer:UIGestureRecognizer) {
        let touchPoint = gestureRecognizer.location(in: gestureRecognizer.view)
        let newCoordinates = (gestureRecognizer.view as? MKMapView)?.convert(touchPoint, toCoordinateFrom: gestureRecognizer.view)
        
        guard let _newCoordinates = newCoordinates else { return }
        control.location = _newCoordinates
        control.showAlert = true
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        let place_title = view.annotation?.title
        guard let selected_place = control.places.first(where: {$0.name==place_title}) else {return}
        control.currentPlace = selected_place
        control.openEditView = true
    }
    
}

struct MapView: UIViewRepresentable{
    @Binding var mapType: String
    @Binding var currentPlace: Place
    @Binding var location: CLLocationCoordinate2D
    @Binding var showAlert: Bool
    @Binding var places: [Place]
    @Binding var openEditView: Bool
    
    
    var mapTypeDict: [String: MKMapType] = [
        "Normal": .standard,
        "Hybrid": .hybrid,
        "Satellite": .satellite
    ]
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        let longPressed = UILongPressGestureRecognizer(target: context.coordinator,
                                                           action: #selector(context.coordinator.addPinBasedOnGesture(_:)))
        mapView.addGestureRecognizer(longPressed)
        
        return mapView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        uiView.mapType = mapTypeDict[mapType] ?? .standard
        uiView.removeAnnotations(uiView.annotations)
        uiView.setRegion(.init(center: currentPlace.location, latitudinalMeters: 1000000, longitudinalMeters: 1000000), animated: true)
        let annotation = MKPointAnnotation()
        annotation.coordinate = currentPlace.location
        annotation.title = currentPlace.name
        uiView.addAnnotation(annotation)
    }
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

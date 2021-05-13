//
//  ContentView.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//
// UIViewRepresentable
// Coordinator
import SwiftUI
import MapKit

struct ContentView: View {
    @State var mapType: String
    @State var currentPlace: Place
    @State var showAlert = false
    @State var desc: String = ""
    @State var name: String = ""
    
    
    @State var places: [Place] = [
        .init(name: "Kazakhstan",desc: "Steppe world", location: .init(latitude: 13.12323, longitude: 45.141243)),
        .init(name: "Russia",desc: "Sybyr", location: .init(latitude: 15.4857847, longitude: 10.12937198)),
        .init(name: "USA",desc: "50 states", location: .init(latitude: 33.4545, longitude: 97.123872))
    ]
    @State var openEditView = false

    var body: some View {
        ZStack{
            VStack{
                MapArea(mapType: $mapType, currentPlace: $currentPlace, desc: $desc, name: $name, showAlert: $showAlert, places: $places, openEditView: $openEditView)
                PlacesView(currentPlace: $currentPlace, places: $places)
            }.ignoresSafeArea(.all)
        }
    }
}



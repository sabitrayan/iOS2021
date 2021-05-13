//
//  MapArea.swift
//  PlacesApp
//
//  Created by ryan on 04.03.2021.
//

import Foundation
import SwiftUI
import MapKit

struct MapArea: View {
    
    @Binding var mapType: String
    @Binding var currentPlace: Place
    
    @Binding var desc: String
    @Binding var name: String
    @State   var location: CLLocationCoordinate2D = CLLocationCoordinate2D()
    @Binding var showAlert: Bool
    @Binding var places: [Place]
    @Binding var openEditView: Bool
    
    var mapTypes = [
        "Normal",
        "Satellite",
        "Hybrid"
    ]
    var body: some View {
        VStack{
            ZStack(alignment: .bottom){
                MapView(mapType: $mapType, currentPlace: $currentPlace,location: $location, showAlert: $showAlert,
                        places: $places,openEditView: $openEditView)
                AlertMap(name: $name, desc: $desc,location: $location, onSave: {_name, _desc, _location in
                    
                    if name.isEmpty==false && desc.isEmpty==false {
                        let new_place = Place(name: name, desc: desc, location: location)
                        currentPlace = new_place
                        self.places.append(currentPlace)
                    }
                    desc=""
                    name=""
                    
                }, isShown: $showAlert, title: "Add Place")
                EditView(openEditView: $openEditView, name: $name, desc: $desc, onEdit: {
                    _name, _desc in
                    if(name.isEmpty==false && desc.isEmpty == false) {
                        let currentIndex = places.firstIndex(where: {$0.name == currentPlace.name}) ?? 0
                        places[currentIndex].name = name
                        places[currentIndex].desc = desc
                        currentPlace.name = name
                        currentPlace.desc = desc
                    }
                })
                Picker(selection: $mapType, label: Text("Map Type"), content: {
                    ForEach(mapTypes, id: \.self){
                        Text($0)
                    }
                })
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 300, height: 75)
            }
        }
        HStack{
            Button("Back"){
                let currentIndex = places.firstIndex(where: {$0.name == currentPlace.name}) ?? 0
                print(currentPlace.name)
                var nextIndex = currentIndex - 1
                if(nextIndex < 0){
                    nextIndex = places.count - 1
                }
                currentPlace = places[nextIndex]
            }.foregroundColor(.white)
            .frame(width: 200, height: 40)
            .background(Color.blue)
            .cornerRadius(20)
            
            Button("Forward"){
                let currentIndex = places.firstIndex(where: {$0.name == currentPlace.name}) ?? -1
                print(currentPlace.name)
                var nextIndex = currentIndex + 1
                if(nextIndex == places.count){
                    nextIndex = 0
                }
                currentPlace = places[nextIndex]
            }.foregroundColor(.white)
            .frame(width: 200, height: 40)
            .background(Color.blue)
            .cornerRadius(20)
        }
    }
}

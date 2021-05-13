//
//  PlacesAppApp.swift
//  PlacesApp
//
//  Created by Darkhan Kuanyshbay on 18.02.2021.
//

import SwiftUI

@main
struct PlacesAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(mapType: "Normal", currentPlace: .init(name: "Kazakhstan",desc: "qaz", location: .init(latitude: 13.12323, longitude: 45.141243)), showAlert: false)
        }
    }
}

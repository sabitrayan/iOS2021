//
//  AlertAddAnnotation.swift
//  PlacesApp
//
//  Created by ryan on 04.03.2021.
//

import Foundation
import SwiftUI
import MapKit

struct AlertMap: View {
    let screenSize = UIScreen.main.bounds
    @Binding var name: String
    @Binding var desc: String
    @Binding var location: CLLocationCoordinate2D
    
    var onSave: (String, String, CLLocationCoordinate2D) -> Void = { city, name, location in }
    @Binding var isShown: Bool
    var title: String = "Add Place"
    var body: some View {
        VStack(spacing: 10) {
                    Text(title)
                        .font(.headline)
                    TextField("", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    TextField("", text: $desc)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    HStack(spacing: 20) {
                        Button("Add") {
                            self.isShown = false
                            self.onSave(self.name,self.desc, self.location)
                        }
                        
                    }
                }
                .padding()
                .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
                .background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
                .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
                .offset(y: isShown ? 0 : screenSize.height)
                .animation(.spring())
                .shadow(color: Color(#colorLiteral(red: 0.8596749902, green: 0.854565084, blue: 0.8636032343, alpha: 1)), radius: 6, x: -9, y: -9)
    }
}

//
//  PlacesView.swift
//  PlacesApp
//
//  Created by ryan on 04.03.2021.
//

import Foundation
import SwiftUI

struct PlacesView: View {
    @Binding var currentPlace: Place
    @Binding var places: [Place]
    
    var body: some View {
        List{
            ForEach(places){ place in
                VStack{
                    HStack{
                        Text(place.name)
                        Spacer()
                        Button("Go"){
                            currentPlace = place
                            print(currentPlace.name)
                        }.foregroundColor(.white)
                        .frame(width: 40, height: 40)
                        .background(Color.blue)
                        .cornerRadius(20)
                    }
                    HStack{
                        Text(place.desc).frame(alignment: .leading)
                        Spacer()
                    }
                }
            }.onDelete(perform: removePlace)
        }.frame(height: UIScreen.main.bounds.height/3)
    }
    private func removePlace(at indexSet: IndexSet){
        places.remove(atOffsets: indexSet)
    }
}

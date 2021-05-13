//
//  EditView.swift
//  PlacesApp
//
//  Created by ryan on 04.03.2021.
//

import Foundation
import SwiftUI

struct EditView: View {
    let screenSize = UIScreen.main.bounds
    @Binding var openEditView : Bool
    @Binding var name: String
    @Binding var desc: String
    
    var onEdit: (String, String) -> Void = { name, desc in }
    
    var body: some View {
            VStack{
                Text("Please Edit")
                TextField("name", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                TextField("desc", text: $desc)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 300)
                Button("Save") {
                    self.openEditView = false
                    self.onEdit(self.name,self.desc)
                    name=""
                    desc=""
                }
            }
            .padding()
            .frame(width: screenSize.width * 0.7, height: screenSize.height * 0.3)
            .background(Color(#colorLiteral(red: 0.9268686175, green: 0.9416290522, blue: 0.9456014037, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 20.0, style: .continuous))
            .offset(y: openEditView ? 0 : screenSize.height)
            .animation(.spring())
            .shadow(color: Color(#colorLiteral(red: 0.8596749902, green: 0.854565084, blue: 0.8636032343, alpha: 1)), radius: 6, x: -9, y: -9)
    }
}

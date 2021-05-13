//
//  AddContactView.swift
//  ios.lab2
//
//  Created by ryan on 4/22/21.
//

import SwiftUI

struct NewContactView: View {
    @ObservedObject var contactViewModel = ContactViewModel()
    @State private var name: String = ""
    @State private var phoneNumber: String = ""
    @State private var selectedGender = "man"
    @Environment(\.presentationMode) var presentation
    
    var genders = ["man", "woman"]
    var didAddContact: (Contact) -> ()
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
            TextField("Enter name and surname", text: $name)
                .frame(minWidth: 100, idealWidth: 120, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Enter phone number", text: $phoneNumber)
                .frame(minWidth: 100, idealWidth: 120, maxWidth: .infinity, minHeight: 40, idealHeight: 40, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
            Button(action:{
                print(name)
                print(phoneNumber)
                print(selectedGender)
                self.didAddContact(Contact(name: name, phoneNumber: phoneNumber, imageName: selectedGender))
                
                self.presentation.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 40, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.blue)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 10)
        }
        .padding(.horizontal,50)
        .foregroundColor(.blue)
    }
    private func removeContact(at indexSet: IndexSet){
        contactViewModel.contacts.remove(atOffsets: indexSet)
    }
}

////
////  NewContact.swift
////  lab2
////
////  Created by Асан Шакабаев on 25.02.2021.
////
//
//import SwiftUI
//
//struct ContactInfoView: View {
//    @ObservedObject var contactViewModel = ContactViewModel()
//    @State private var name: String = ""
//    @State private var phoneNumber: String = ""
//    @State private var selectedGender = "man"
//    
//    @Environment(\.presentationMode) var presentation
//    
//    
//    var genders = ["man", "woman"]
//    
//    var diddeleteContact: (Contact) -> ()
//    
//    
//    var body: some View {
//        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 5){
//            Spacer()
//            Button(action:{
//                print(name)
//                print(phoneNumber)
//                print(selectedGender)
////                contactViewModel.add(contact: Contact(name: name, phoneNumber: phoneNumber, imageName: selectedGender))
//                self.diddeleteContact(Contact(name: name, phoneNumber: phoneNumber, imageName: selectedGender))
//                
//                self.presentation.wrappedValue.dismiss()
//            }) {
//                Text("call")
//                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 40, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//            }
//            Button(action:{
//                print(name)
//                print(phoneNumber)
//                print(selectedGender)
////                contactViewModel.add(contact: Contact(name: name, phoneNumber: phoneNumber, imageName: selectedGender))
//                self.diddeleteContact(Contact(name: name, phoneNumber: phoneNumber, imageName: selectedGender))
//                
//                self.presentation.wrappedValue.dismiss()
//            }) {
//                Text("delete")
//                    .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: .infinity, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 40, maxHeight: 40, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//            }
//            .padding(.horizontal, 10)
//        }
//        .padding(.horizontal,50)
//        .foregroundColor(.blue)
//    }
//}
//
////struct ContactInfoView: PreviewProvider {
////    static var previews: some View {
////        ContactInfoView(didAddContact: {})
////    }
////}
//

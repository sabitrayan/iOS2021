//
//  ContentView.swift
//  ios.lab2
//
//  Created by ryan on 4/22/21.
//

import SwiftUI
struct Contact: Identifiable{
    var name: String
    var phoneNumber: String
    var imageName: String
    var id = UUID()
    
}

class ContactViewModel: ObservableObject {
    @Published var contacts: [Contact] = [
        .init(name: "Rayan Bratan", phoneNumber: "87472669023", imageName: "man"),
    ]
    func add(contact:Contact) {
        self.contacts.append(contact)
    }
}

struct ContentView: View {
    @ObservedObject var contactViewModel = ContactViewModel()
    @State private var showSecondView = false

    
    var body: some View {
        NavigationView{
                List{
                    if contactViewModel.contacts.count != 0 {
                        ForEach(contactViewModel.contacts){ contact in
                            ContactView(contact: contact)
                        }.onDelete(perform: removeContact)
                    }else{
                        Text("Empty")
                    }
                }.navigationBarTitle("Contacts", displayMode:.inline)
                .toolbar(content: {
                    Button(action: {
                        showSecondView.toggle()
                    }, label: {
                        NavigationLink("+", destination: NewContactView(didAddContact: {
                            contact in
                            contactViewModel.contacts.append(contact)
                           showSecondView.toggle()
                        }), isActive: $showSecondView)
                    })
                })
        }
        .foregroundColor(.red)
    }
    private func removeContact(at indexSet: IndexSet){
        contactViewModel.contacts.remove(atOffsets: indexSet)
    }
}

struct ContactView: View {
    private let contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    var body: some View{
        HStack{
            Image(contact.imageName)
                .resizable()
                .frame(width: 80, height: 80)
            Spacer()
            VStack(spacing: 5){
                Text(contact.name)
                    .font(.system(size: 24, weight: .medium))
                Text(contact.phoneNumber)
                    .font(.system(size: 15))
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  SwiftUI-Form
//
//  Created by Sikandar Ali on 16/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var  firstname = ""
    @State private var  lastname = ""
    @State private var brithdate = Date()
    @State private var   shouldsendnewslatter = false
    @State private var  Numberoflikes = 0
    var body: some View {
        NavigationView{
            Form {
                
                Section(header: Text("Personal Information") ){
                    TextField("First Name", text: $firstname)
                    TextField("Last Name", text: $lastname)
                    DatePicker("Birthdate", selection: $brithdate, displayedComponents: .date)
                }
                
                Section(header: Text("Action") ){
                    Toggle("", isOn: $shouldsendnewslatter)
                        .toggleStyle(SwitchToggleStyle.init(tint: .red))
                     
                    Stepper("Number of Lkes", value: $Numberoflikes,in: 0...100)
                    Text("We have \(Numberoflikes) Likes")
                    Link("Terms Of Services", destination: URL(string: "https://www.linkedin.com/in/sikandar-ali-307/")!)
                }
            }
            
            .navigationTitle("Account")
            .toolbar{
                ToolbarItemGroup(placement:.navigationBarTrailing){
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                        }
                    Button("Save", action: saveUser)
              }
            }
          }
        .accentColor(.green)
        }
        
    func saveUser(){
        print("save user")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            
        }
    }
}
#if canImport(UIKit)
extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
#endif

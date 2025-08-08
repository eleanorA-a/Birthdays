//
//  ContentView.swift
//  Birthdays
//
//  Created by Scholar on 8/8/25.
//

import SwiftUI

struct ContentView: View {
    @State private var Friends: [Friend] = [
        Friend(name: "Eleanor", birthday: .now),
        Friend(name: "Sarah", birthday: .now)
    ]
    @State private var newName = ""
    @State private var newBirthday = Date.now
    
    var body: some View {
        NavigationStack{
            
            
            List(Friends, id:\.name) { friend in
                HStack{
                    Text(friend.name)
                    Spacer()
                    Text(friend.birthday,format: .dateTime.month(.wide).day().year())
                }//End of HStack
            }
            .navigationTitle("Birthdays")
            .safeAreaInset(edge:.bottom) {
                VStack(alignment:.center, spacing: 20){
                    Text("New Birthday")
                        .font(.headline)
                    DatePicker(selection: $newBirthday, in:Date.distantPast...Date.now, displayedComponents: .date){
                        TextField("Name",text: $newName)
                            .textFieldStyle(.roundedBorder)
                    }
                    Button("Save") {
                        let newFriend = Friend(name: newName, birthday: newBirthday)
                        Friends.append(newFriend)
                        newName = ""
                        newBirthday = .now
                    }
                    .bold()
                }
                .padding()
                .background(.bar)
            }//.safe end
        }//Ending of Navigation
    }//End of Var Body
}//End of Struct

    #Preview {
        ContentView()
    }




//
//  ContentView.swift
//  BirthDay App
//
//  Created by Scholar on 6/6/25.
//

import SwiftUI

struct ContentView: View {
    @State private var friends: [Friend] = [
        Friend(name:"Alonnah", birthday: .now),
        Friend(name:"Korra", birthday: Date(timeIntervalSince1970: 0))]
    @State private var newName = ""
    @State private var newBirthday =  Date.now
    var body: some View {
        List(friends, id: \.name) { friend in
            HStack {
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            }
        }
        .navigationTitle("Birthdays")
        .safeAreaInset(edge: .bottom) {
            VStack(alignment: .center, spacing: 20) {
                Text("New Birthday")
                    .font(.headline)
                DatePicker(selection: $newBirthday,in:Date.distantPast...Date.now,displayedComponents:.date{
                    TextField("Name", text: $newName){
                        .textFieldStyle(.roundedBorder)
                    }
                }
            }
            friends.append(Friend(name: newName, birthday: newBirthday))
            newName = ""
            Text("Add")
        }
    }
}
    
    
#Preview {
    ContentView()
}

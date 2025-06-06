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
    var body: some View {
        List(friends, id: \.name) { friend in
            HStack {
                Text(friend.name)
                Spacer()
                Text(friend.birthday, format: .dateTime.month(.wide).day().year())
            }
        }
        .navigationTitle("Birthdays")
    }
}
    #Preview {
        ContentView()
    }

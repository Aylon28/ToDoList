//
//  ProfileView.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                VStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.blue)
                        .frame(width: 125, height: 125)
                        .padding()
                    VStack (alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.name)
                        }
                        HStack {
                            Text("Id: ")
                                .bold()
                            Text(user.id)
                        }
                        HStack {
                            Text("Member since: ")
                                .bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                    }
                    Spacer()
                    Button("Log Out") {
                        viewModel.logOut()
                    }
                    .foregroundColor(.red)
                }
                .navigationTitle("Profile")
            } else {
                Text("Loading profile...")
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        HStack{ }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

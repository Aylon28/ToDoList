//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "To Do List", subtitle: "Get. Things. Done.", angle: 15, backgroundColor: .blue)
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("E-mail address", text: $viewModel.email)
                        .textInputAutocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                .scrollContentBackground(.hidden)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegistrationView())
                }
                .padding(.bottom, 50)
                
                //Spacer()
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

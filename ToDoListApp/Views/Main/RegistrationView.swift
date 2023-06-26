//
//  RegistrationView.swift
//  ToDoListApp
//
//  Created by Ilona Punya on 3.05.23.
//

import SwiftUI

struct RegistrationView: View {
    @State var viewModel = RegistrationViewViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register", subtitle: "Start organizing your life", angle: -15, backgroundColor: .orange)
            Spacer()
            Form {
                TextField("Full name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("E-mail address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Create account", background: .green) {
                    viewModel.register()
                }
            }
            .scrollContentBackground(.hidden)
            .offset(y: -40)
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}

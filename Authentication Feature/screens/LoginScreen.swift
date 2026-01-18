//
//  ContentView.swift
//  Authentication Feature
//
//  Created by Nadira Seitkazy  on 14.01.2026.
//

import SwiftUI

struct LoginScreen: View {
    @Binding var path: [AppRoute]
    @State private var email = Strings.nul
    @State private var password = Strings.nul
    
    var body: some View {
        VStack(spacing: 20) {
            Text(Strings.Login.title)
                .font(.largeTitle)
                .bold()
                .foregroundColor(.blue)
                .padding()

            SimpleTextField(
                label: Strings.Login.email,
                text: $email,
                placeholder: Strings.placeholder.emailLabel,
                validator: { text in
                    if text.isEmpty { return Strings.required }
                    if text.count < 3 { return Strings.Validation.emailError}
                    return nil
                }
            )
            
            SecurePasswordView(
                password: $password,
                validator: { text in
                    if text.isEmpty { return Strings.required }
                    if text.count < 6 { return Strings.Validation.passwordError }
                    return nil
                }
            )
            
            PrimaryButton(title: Strings.Login.title) {
                let usernameValid = !email.isEmpty && email.count >= 3
                let passwordValid = !password.isEmpty && password.count >= 6
                
                if usernameValid && passwordValid {
                    path.append(.home)
                } else {
                    print(Strings.Validation.validationFailed)
                }
            }
            HStack {
                Text(Strings.Login.text)
                    .foregroundColor(.gray)
                
                Button(Strings.SignUp.title) {
                    path.append(.signup)
                }
                .foregroundColor(.blue)
                .bold()
                .padding(8)
            }        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}



#Preview {
    RootView()
}

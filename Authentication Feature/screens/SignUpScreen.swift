//
//  SIgnUp.swift
//  Authentication Feature
//
//  Created by Nadira Seitkazy  on 14.01.2026.
//
import SwiftUI

struct  SignUpScreen: View {
    @Binding var path: NavigationPath 
    @State private var name = Strings.nul
    @State private var email = Strings.nul
    @State private var password = Strings.nul
    @State private var confirmPassword = Strings.nul
    
    @State private var nameError = Strings.nul
    @State private var emailError = Strings.nul
    @State private var passwordError = Strings.nul
    @State private var confirmPasswordError = Strings.nul
    
    @State private var navigate = false
    
    var body: some View{
        
            VStack(spacing:20){
                Text(Strings.SignUp.title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                
                SimpleTextField(
                    label: Strings.SignUp.name,
                    text: $name,
                    placeholder: Strings.placeholder.nameLabel,
                    validator: { text in
                        if text.isEmpty { return Strings.required }
                        if text.count < 3 { return Strings.Validation.nameError }
                        return nil
                    }
                )
                
                
                SimpleTextField(
                    label: Strings.SignUp.email,
                    text: $email,
                    placeholder: Strings.placeholder.emailLabel,
                    validator: { text in
                        if text.isEmpty { return Strings.required }
                        if !text.contains(Strings.emailContain) { return Strings.Validation.invalidEmail }
                        return nil
                    }
                )
                
                SecurePasswordView(
                    label: Strings.SignUp.confirm,
                    password: $password,
                    placeholder:Strings.placeholder.passwordLabel ,
                    validator: { text in
                        if text.isEmpty { return Strings.Validation.password
}
                        if text != password { return Strings.Validation.confirmPasswordError }
                        return nil
                    }
                )
                SecurePasswordView(
                    label: Strings.SignUp.confirm,
                    password: $confirmPassword,
                    placeholder:Strings.placeholder.confirmLabel ,
                    validator: { text in
                        if text.isEmpty { return Strings.Validation.confirm}
                        if text != password { return Strings.Validation.confirmPasswordError }
                        return nil
                    }
                )
                
                PrimaryButton(title: Strings.Login.title) {
                    let usernameValid = !email.isEmpty && email.count >= 3
                    let passwordValid = !password.isEmpty && password.count >= 6
                    let emailValid = !email.isEmpty && email.contains(Strings.emailContain)
                    let confirmValid = !confirmPassword.isEmpty && confirmPassword == password
                    
                    if usernameValid && emailValid && passwordValid && confirmValid {
                        path.append(AppRoute.home)
                    } else {
                        print(Strings.Validation.validationFailed)
                    }
                }
                HStack {
                    Text(Strings.SignUp.text)
                        .foregroundColor(.gray)
                    
                    Button(Strings.Login.title) {
                        path.append(AppRoute.login)
                    }
                    .foregroundColor(.blue)
                    .bold()
                    .padding(8)
                }
            }
        .padding()
        .navigationBarBackButtonHidden(true) 
        .navigationDestination(isPresented: $navigate) {
           RootView()
        }
    }
}


#Preview {
    RootView()
}

//
//  SIgnUp.swift
//  Authentication Feature
//
//  Created by Nadira Seitkazy  on 14.01.2026.
//
import SwiftUI

struct  SignUpScreen: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    @State private var nameError = ""
    @State private var emailError = ""
    @State private var passwordError = ""
    @State private var confirmPasswordError = ""
    
    @State private var navigate = false
    
    var body: some View{
        NavigationStack{
            VStack(spacing:20){
                Text("Sign Up")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                
                
                Text("Name")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Name",text: $name,prompt:
                            Text("Required"))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(nameError.isEmpty ? Color.blue: Color.red, lineWidth: 1 ))
                .onChange(of: name) { _ in validateName() }
                
                if !nameError.isEmpty {
                    Text(nameError)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                
                Text("Email")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Email",text: $email,prompt:
                            Text("Required"))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6) .stroke(emailError.isEmpty ? Color.blue :  Color.red, lineWidth: 1 ) )
                .onChange(of: email) { _ in validateEmail() }
                
                if !emailError.isEmpty {
                    Text(emailError)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                Text("Password")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Password",text: $password,prompt:
                                Text("Required"))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6) .stroke(passwordError.isEmpty ? Color.blue : Color.red, lineWidth: 1 ) )
                .onChange(of: password) { _ in validatePassword() }
                
                if !passwordError.isEmpty {
                    Text(passwordError)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                Text("Confirm Password")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Confirm Password",text: $confirmPassword ,prompt:
                                Text("Required"))
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6) .stroke(confirmPasswordError.isEmpty ? Color.blue : Color.red ,lineWidth: 1 ) )
                .onChange(of: confirmPassword) { _ in validateConfirmPassword() }
                
                if !confirmPasswordError.isEmpty {
                    Text(confirmPasswordError)
                        .foregroundColor(.red)
                        .font(.caption)
                }
                
                Button(action: {
                    validateFields()
                }) {
                    Text("Sign Up")
                }
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .cornerRadius(8)
                
                HStack{
                    Text("Already have an account?")
                    NavigationLink(destination: LoginScreen()){
                        Text("Login")
                    }
                }
            }
            
        }
        .padding()
        .navigationDestination(isPresented: $navigate) {
            HomeScreen()
        }
        
    }
    
    func validateName() {
        if name.isEmpty {
            nameError = "Enter your name"
        }else{
            nameError = ""
        }
    }
    
    func validateEmail() {
        if email.isEmpty || !email.contains("@") {
            emailError = "Enter a valid email"
        } else {
            emailError = ""
        }
    }
    
    func validatePassword(){
        if password.count < 6 {
            passwordError = "Password must be at least 6 characters"
        }else{
            passwordError = ""
        }
    }
    
    func validateConfirmPassword() {
        if confirmPassword != password {
            confirmPasswordError = "Password do not match"
        }else {
            confirmPasswordError = ""
        }
    }
    
    func validateFields() {
        validateName()
        validateEmail()
        validatePassword()
        validateConfirmPassword()
        
        if nameError.isEmpty && emailError.isEmpty && passwordError.isEmpty && confirmPasswordError.isEmpty {
            navigate = true
        }
    }
    
    
    
}


#Preview {
    SignUpScreen()
}

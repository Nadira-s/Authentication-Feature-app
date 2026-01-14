//
//  ContentView.swift
//  Authentication Feature
//
//  Created by Nadira Seitkazy  on 14.01.2026.
//

import SwiftUI

struct LoginScreen: View {
    @State private var email = ""
    @State private var password = ""
    var body: some View {
        NavigationStack{
            VStack(spacing:20) {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                    
                Text("Email")
                    .frame(maxWidth:.infinity , alignment: .leading)
                TextField(text: $email, prompt: Text("Required")) {
                    Text("Email")
                       
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.blue,lineWidth: 1 ))
                
                Text("Password")
                    .frame(maxWidth:.infinity, alignment: .leading)
                SecureField(text: $password, prompt: Text("Required")) {
                    Text("Password")
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(6)
                .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.blue,lineWidth: 1 ))
                
                NavigationLink( destination: HomeScreen()){
                    Text("Login")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                Button (action: {
                    print("")})
                {
                    Text("Forgot Password")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(8)
                }
                HStack{
                    Text("Don’t have an account?")
                    Button(action: {
                        print("")})
                    {
                        NavigationLink(destination: SignUpScreen()){
                            Text("Sign Up")
                        }
                    }
                }
                
            }
            .padding()
            
            
            
            
            
        }
    }
    
}


#Preview {
    LoginScreen()
}

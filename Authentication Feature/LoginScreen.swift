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
        VStack {
            
                Text("Email")
            
                TextField(text: $email, prompt: Text("Required")) {
                    Text("Email")
                }
                Text("Password")
                SecureField(text: $password, prompt: Text("Required")) {
                    Text("Password")
                }
                
                Button (action: {
                    print("Login tapped")})
                {
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
                
                
            }
        .padding()
                
            
        
        
    }
}

    


#Preview {
    LoginScreen()
}

//
//  SplashScreen.swift
//  Authentication Feature
//
//  Created by Nadira Seitkazy  on 14.01.2026.
//

import SwiftUI

struct SplashScreen: View {
    @State private var isFinished = false
    
    var body: some View {
        if  isFinished {
            LoginScreen()
        } else {
            VStack {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding(30)
                let timer = Date()...Date().addingTimeInterval(3)
                
                ProgressView(timerInterval: timer)
                    .padding(50)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3 ){
                    isFinished = true
                }
            }
        }
        
    }
    
    
    
}



#Preview {
    SplashScreen()
}

//
//  HomeScreen.swift
//  Authentication Feature
//
//  Created by Nadira Seitkazy  on 14.01.2026.
//

import SwiftUI

struct HomeScreen: View {
    @Binding var path: [AppRoute]
    
    var body: some View {
        Text(Strings.homeTitle)
    }
    
}

#Preview {
    HomeScreen(path: .constant([.home]))
}

//
//  ContentView.swift
//  Ronak Assignment
//
//  Created by Bhaskar Reddy Ch on 02/05/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            
            UsersView()
                .background(.black)
        }
        .padding()
        .background(.black)
    }
}

#Preview {
    ContentView()
}

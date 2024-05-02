//
//  UsersView.swift
//  Ronak Assignment
//
//  Created by Bhaskar Reddy Ch on 02/05/24.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var usersVM = UsersViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                ScrollView {
                    LazyVStack {
                        ForEach(usersVM.users, id: \.self) { user in
                            UserView(user: user)
                                .onAppear(){
                                    usersVM.loadMoreContent(currentItem: user)
                                }
                        }
                    }
                }
                .navigationTitle("Users")
                .foregroundColor(.black)
                .padding(.bottom, 10)
                
                if self.usersVM.isLoading {
                    
                    LoaderView()
                }
            }
            
            
        }
        
    }
}


struct LoaderView: View {
    
    var body: some View {
        
        HStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .green))
                .padding(.trailing, 10)
            Text("Loading....")
                .fontWeight(.semibold)
                .foregroundStyle(.green)
                .bold()
        }
    }
}

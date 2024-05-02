//
//  UserCellView.swift
//  Ronak Assignment
//
//  Created by Bhaskar Reddy Ch on 02/05/24.
//

import SwiftUI

struct UserView: View {

    var user : User
    
    var body: some View {
        
        NavigationLink(destination: UserDetailView(user: user)){
            
            HStack(alignment: .center, spacing: nil, content: {
                //Image
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.all, 20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    HStack{
                        Text("id :")
                            .fontWeight(.semibold)
                        Text("\(user.id)")
                    }
                    
                    HStack{
                        Text("Title :")
                            .fontWeight(.semibold)
                            .bold()
                        Text("\(user.title)")
                            .lineLimit(2)
                            .padding(EdgeInsets())
                    }
                    
                })
                .foregroundColor(.white)
            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .leading)
            .background(Color.black)
            .cornerRadius(10.0)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
            .padding(.horizontal, 10)
            .padding(.vertical, 5)
        }
    }
}


struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(userId: 1, id: 2, title: "sdfsd", body: "sdfsd")
        UserView(user: user)
            .previewLayout(.fixed(width: 375.0, height: 100.0))
    }
}

//
//  UserDetailView.swift
//  Ronak Assignment
//
//  Created by Bhaskar Reddy Ch on 02/05/24.
//

import SwiftUI

struct UserDetailView: View {

    var user : User
    
    var body: some View {
        
            VStack( spacing: nil, content: {

                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80.0, height: 80.0, alignment: .center)
                    .foregroundColor(.white)
                    .padding(.all, 20)
                
                VStack(alignment: .leading, spacing: 5, content: {
                    HStack{
                        Text("User id :")
                            .fontWeight(.semibold)
                        Text("\(user.userId)")
                    }
                    
                    HStack{
                        Text("Title :")
                            .fontWeight(.semibold)
                            .bold()
                        Text("\(user.title)")
                             .padding(EdgeInsets())
                    }
                    .padding(.bottom, 5)
                    
                    VStack(alignment: .leading){
                        Text("Body :")
                            .fontWeight(.semibold)
                            .bold()
                            .padding(.bottom, 5)
                        Text("\(user.body)")
                            .lineLimit(2)
                            .padding(EdgeInsets())
                    }
                    
                })
                .foregroundColor(.white)

            })
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .top)
            .background(Color.black)
            .shadow(color: Color.black.opacity(0.2), radius: 2, x: 0, y: 0)
         }
}


struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(userId: 1
                        , id: 2
                        , title: "maxime id vitae nihil numquam"
                        , body: "eos qui et ipsum ipsam suscipit aut\nsed omnis non odio\nexpedita earum mollitia molestiae aut atque rem suscipit\nnam impedit esse")
        UserDetailView(user: user)
            .previewLayout(.fixed(width: 375.0, height: 100.0))
    }
}

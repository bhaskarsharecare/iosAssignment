//
//  UserViewModel.swift
//  Ronak Assignment
//
//  Created by Bhaskar Reddy Ch on 02/05/24.
//

import SwiftUI
import Alamofire

class UsersViewModel : ObservableObject {
    
    @Published var users : [User] = []
    @Published var isLoading : Bool = false
    
    var canLoadMore: Bool = true
    var page : Int = 1
    
    init() {
        
        getUsers()
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().standardAppearance = navBarAppearance
    }
    
    func loadMoreContent(currentItem item: User){
        
        let thresholdIndex = self.users.index(self.users.endIndex, offsetBy: -1)
        if thresholdIndex == item.id && canLoadMore {
            page += 1
            getUsers()
        }
    }
    
    func getUsers(){
        
        self.isLoading = true
        let apiUrl = "https://jsonplaceholder.typicode.com/posts?userId=\(page)"
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        AF.request(apiUrl).responseDecodable(of: [User].self, decoder: decoder) { [weak self] (response) in
            
            self?.isLoading = false
            switch response.result{
                case .success(let users):
                self?.canLoadMore = users.count > 0
                self?.users.append(contentsOf: users)
                case .failure(let afError):
                    print("Error : \(afError)")
             }
        }
    }
    
}

//
//  UserDataModel.swift
//  Ronak Assignment
//
//  Created by Bhaskar Reddy Ch on 02/05/24.
//

import Foundation

struct User : Decodable, Hashable{
    
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

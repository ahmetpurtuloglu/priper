//
//  CategoryModel.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation

class CategoryModel: Identifiable,Codable {
    let id: Int
    let name:String
    let imageURL:String
    
    enum CodingKeys: String,CodingKey {
        case id = "id"
        case name = "name"
        case imageURL = "image_url"
    }
}

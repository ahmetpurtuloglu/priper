//
//  CategoryDataService.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import Combine

class CategoryDataService {
    
    @Published var categories: [CategoryModel] = []
    
    var categorySubscription: AnyCancellable?
    
    init() {
        getCategories()
    }
    
    func getCategories() {
        guard let url = URL(string: "https://priper.com.tr/api/categories") else { return }
        categorySubscription = NetworkingManager.download(url: url)
            .decode(type: [CategoryModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCategory in
                self?.categories = returnedCategory
            })
    
    }
    
}

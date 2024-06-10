//
//  CampaignImageViewModel.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import SwiftUI
import Combine

class CampaignImageViewModel:ObservableObject {
    
    @Published var image: UIImage?
    @Published var isLoading: Bool = false
    
    private let campaign: CampaignModel
    private let dataService: CampaignImageService
    private var cancellables = Set<AnyCancellable>()
    
    init(campaign: CampaignModel) {
        self.campaign = campaign
        self.dataService = CampaignImageService(campaign: campaign)
        self.addSubscribers()
        self.isLoading = true
    }
    
    func addSubscribers() {
        dataService.$image
            .sink { [weak self] (_) in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellables)
        
    }
}


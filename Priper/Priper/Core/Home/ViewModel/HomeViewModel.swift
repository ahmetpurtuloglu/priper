//
//  HomeViewModel.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    // campaigns
    
    @Published var allCampaigns: [CampaignModel] = []
    @Published var popularCampaigns: [CampaignModel] = []
    @Published var expiringCampaigns: [CampaignModel] = []
    
    @Published var searchText:String = ""
    @Published var filterByPopular: String = ""
    
    private let dataService = CampaignDataServices()
    private var cancellables = Set<AnyCancellable>()
    
    // categories
    
    @Published var categories: [CategoryModel] = []
    
    private let dataServiceCategory = CategoryDataService()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
//        dataService.$allCampaigns
//            .sink { [weak self] returnedCampaigns in
//                self?.allCampaigns = returnedCampaigns
//            }
//            .store(in: &cancellables)
//
        $searchText
            .combineLatest(dataService.$allCampaigns)
            .debounce(for: .seconds(0.1), scheduler: DispatchQueue.main)
            .map(filterCampaigns)
            .sink { [weak self] returnedCampaigns in
                self?.allCampaigns = returnedCampaigns
            }
            .store(in: &cancellables)
        
        dataService.$popularCampaigns
            .map(filterCampaignsPopular)
            .sink { [weak self] campaigns in
                self?.popularCampaigns = campaigns
            }
            .store(in: &cancellables)
        
        dataServiceCategory.$categories
            .sink { [weak self] categories in
                self?.categories = categories
            }
            .store(in: &cancellables)
        
            
        
    }
    
    
    private func filterCampaignsPopular(campaigns:[CampaignModel]) -> [CampaignModel] {
        return campaigns.filter { campaign -> Bool in
            return campaign.popular.description == "true"
        }
    }
    
    
    private func filterCampaigns(text:String,campaigns:[CampaignModel]) -> [CampaignModel] {
        
        guard !text.isEmpty else {
            return campaigns
            
        }
        
        let lovercasedText = text.lowercased()
        
        return campaigns.filter { campaign -> Bool in
            return campaign.name.lowercased().contains(lovercasedText) || campaign.detailsShort.lowercased().contains(lovercasedText)
        }
    }
}

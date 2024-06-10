//
//  CampaignDataServices.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import Combine

class CampaignDataServices {
    
    @Published var allCampaigns : [CampaignModel] = []
    @Published var popularCampaigns : [CampaignModel] = []
    
    private let fileManager = LocalFileManager.instance

    
//    var cancellables = Set<AnyCancellable>()
    var campaignSubscription: AnyCancellable?
    
    init() {
        getCampaigns()
    }
    
    func downloadCampaigns() {
        guard let url = URL(string: "https://priper.com.tr/api/promotions") else { return }
        
        campaignSubscription = NetworkingManager.download(url: url)
            .decode(type: [CampaignModel].self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedCampaigns in
                self?.allCampaigns = returnedCampaigns
                self?.popularCampaigns = returnedCampaigns
                self?.campaignSubscription?.cancel()
                self?.fileManager.saveCampaign(campaign: returnedCampaigns, campaignName: "campaigns", folderName: "campaignsFolder")
                
            })
        /*
        
        // this is the 
//       campaignSubscription = URLSession.shared.dataTaskPublisher(for: url)
//            .subscribe(on: DispatchQueue.global(qos: .default))
//            .tryMap { output -> Data in
//
//                guard let response = output.response as? HTTPURLResponse,
//                      response.statusCode >= 200 && response.statusCode < 300 else {
//                    throw URLError(.badServerResponse)
//                }
//                return output.data
//            }
//            .receive(on: DispatchQueue.main)
//            .decode(type: [CampaignModel].self, decoder: JSONDecoder())
//            .sink { completion in
//                switch completion {
//                case .finished:
//                    break
//                case .failure(let error):
//                    print(error.localizedDescription)
//
//                }
//            } receiveValue: { [weak self] returnedCampaigns in
//                self?.allCampaigns = returnedCampaigns
//                self?.campaignSubscription?.cancel()
//            }
         */
        
    }
    func getCampaigns() {
         let savedCampaign = fileManager.getCampaign(campaignName: "campaigns", folderName:"campaignsFolder")
            allCampaigns = savedCampaign
        
        
            print("download campaigns")
            downloadCampaigns()
        
        
    }

}

//
//  CoinImageService.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import SwiftUI
import Combine

class CampaignImageService {
    
    @Published var image: UIImage? = nil
    
    private var imageSubscription: AnyCancellable?
    
    private let campaign: CampaignModel
    
    private let fileManager = LocalFileManager.instance
    
    private let folderName = "campaign_images"
    
    private let imageName: String
    
    init(campaign:CampaignModel) {
        self.campaign = campaign
        self.imageName = "\(campaign.id)"
       getCampaignImage()
        
    }
    
    private func getCampaignImage() {
        if let savedImage = fileManager.getImage(imageName: "\(campaign.id)", folderName: folderName){
            image = savedImage
            print("retrieved image from files")
        }
        else {
            downloadCampaignImage()
            print("download image now")
        }
    }
    
    private func downloadCampaignImage() {
       
        guard let url = URL(string: campaign.imageURL) else { return  }
        
        imageSubscription = NetworkingManager.download(url: url)
            .tryMap({ data -> UIImage? in
                return UIImage(data: data)
            })
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedImage in
                guard let self = self,
                let downloadedImage = returnedImage else { return  }
                self.image = returnedImage
                self.imageSubscription?.cancel()
                self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
            })
    }
    
    
    
}

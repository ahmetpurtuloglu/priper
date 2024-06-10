//
//  CampaignImageView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI

struct CampaignImageView: View {
    
    @StateObject var viewModel: CampaignImageViewModel
    
    init(campaign:CampaignModel) {
        _viewModel = StateObject(wrappedValue: CampaignImageViewModel(campaign: campaign))
    }
    
    var body: some View {
        ZStack{
            if let image = viewModel.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if viewModel.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.black)
            }
        }
    }
}

struct CampaignImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        CampaignImageView(campaign: dev.campaign)
            .environmentObject(dev.homeViewModel)
    }
}

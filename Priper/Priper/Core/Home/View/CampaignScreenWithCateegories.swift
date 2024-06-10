//
//  CampaignScreenWithCateegories.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 10.08.2023.
//

import SwiftUI

struct CampaignScreenWithCategories: View {
    
    let campaign: [CampaignModel]
    let text:String
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(campaign) { campaign in
                        NavigationLink {
                            CampaignDetailView(campaign: campaign)
                        } label: {
                            CampaignRowView(campaign: campaign)
                        }
                    }
                    .padding(3)
                }
                .background(Color.background.backgroundThird)
                .padding(15)
                .padding(.top,75)
                .padding(.bottom,40)
            }
            .frame(minWidth: UIScreen.main.bounds.width,minHeight: UIScreen.main.bounds.height)
        }
        .navigationTitle(text)
        .navigationBarTitleDisplayMode(.inline)
    }
    
}

struct CampaignScreenWithCategories_Previews: PreviewProvider {
    static var previews: some View {
        CampaignScreenWithCategories(campaign: [dev.campaign,dev.campaign,dev.campaign,dev.campaign,dev.campaign,dev.campaign,dev.campaign], text: "bomboş")
    }
}

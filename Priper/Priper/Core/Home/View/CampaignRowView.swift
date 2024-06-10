//
//  CampaignRowView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI

struct CampaignRowView: View {
    
    let campaign: CampaignModel
    
    var body: some View {
 
            HStack {
                CampaignImageView(campaign: campaign)
                    .frame(width: 100,height: 100)
                    .padding(.trailing)
                VStack {
                    Text(campaign.name)
                        .font(.headline)
                        .frame(width:200,height: 20)
                        .foregroundColor(Color.text.primary)
                    Text(campaign.detailsShort)
                        .font(.caption2)
                        .frame(width:200,height: 80)
                        .foregroundColor(Color.text.primary)
                }
                Spacer()
            }
            .shadow(radius: 8)
            
//            .frame(width: UIScreen.main.bounds.width / 1.2)
            .frame(height: 100)
            .frame(maxWidth: 400)
            .padding()
            .background(Color.background.secondary)
            .cornerRadius(8)
            .shadow(color: .secondary, radius: 8)
           
       
    }
       

}

struct CampaignRowView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignRowView(campaign: dev.campaign)
    }
}

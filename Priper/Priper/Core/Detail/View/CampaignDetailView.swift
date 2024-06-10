//
//  CampaignDetailView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI


struct CampaignDetailView: View {

    let campaign: CampaignModel
    
    @State var text = ""
    @State var buttonText = "Kodu Kopyala"
    private let pasteboard = UIPasteboard.general
    
    var body: some View {
        ZStack {
            Color.secondary.opacity(0.3)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                   CampaignImageView(campaign: campaign)
                        .frame(width: 200,height: 200)
                    
                    VStack {
                        Text(campaign.name)
                            .font(.largeTitle)
                            .bold()
                    }
                    .frame(width: UIScreen.main.bounds.width / 1.2)
                   
                    VStack{
                        Text(campaign.details)
                            .padding()
                            .background(Color.secondary.opacity(0.3))
                            .cornerRadius(10)
                            .font(.footnote)
                    }
                    .padding()
                    
                    if campaign.promoCode.isEmpty == false {
                        VStack{
                            HStack {
                                Text("Promosyon Kodu:")
                                    .font(.caption)
                                Text(campaign.promoCode)
                                    .font(.headline)
                            }
                            Button {
                                copy()
                            } label: {
                                
                                Label(buttonText,systemImage: "doc.on.doc.fill")
                                    .font(.subheadline)
                            }
                            
                            .frame(width: UIScreen.main.bounds.width / 1.2 )
                            
                        }
                        .padding(8)
                        .background(Color.secondary.opacity(0.3))
                        .cornerRadius(10)
                    }
                    
                    if true{
                        
                        VStack(spacing:0){
                            
                            HStack {
                                
                                Link("Kampanya linki için buraya tıklayınız", destination: (URL(string: campaign.promotionURL) ?? URL(string: "https://tr-tr.facebook.com/"))!)
                                    .font(.subheadline)
                                    .cornerRadius(10)
                            }
                            
                            
                            .frame(width: UIScreen.main.bounds.width / 1.2 )
                            
                        }
                        .padding(8)
                        .background(Color.secondary.opacity(0.3))
                        .cornerRadius(10)
                        
                    }
                    
                    VStack{
                        Text("Kampanya bitiş tarihi: \(campaign.dateExpiringTurkish)")
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .padding()
                        
                    }
                }
            }
        }
    }
    func copy(){
        text = campaign.promoCode
        pasteboard.string = self.text
        self.buttonText = "Kopyalandı"
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3){
            self.buttonText = "Kopyala"
        }
    }
}

struct CampaignDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CampaignDetailView(campaign:dev.campaign)
    }
}

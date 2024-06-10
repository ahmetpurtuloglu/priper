//
//  HomeView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    @ObservedObject var networkingManager = NetworkManager()
    
    var body: some View {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.blue.opacity(0.8),Color.background.primary]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                   
                    ScrollView(showsIndicators: false) {
                        HStack {
                            
                            Spacer()
                            
                            NavigationLink {
                                SettingsView()
                            } label: {
                                Image(systemName: "gear")
                                    .font(.headline)
                                    .foregroundColor(Color.text.primary)
                            }
                         
                        }.padding()
                      
                        Text("PRIPER")
                            .font(Font.custom("Times New Roman", size: 50))
                            .padding(20)
                        SearchBarView(searchText: $viewModel.searchText)
                        
                            categories
                            .padding(.vertical)
                            if !networkingManager.isConnected {
                                Text("İnternete bağlı değilsiniz. Güncel kampanyaları görebilmek için internet bağlantısı gereklidir.")
                                    .padding()
                                    .foregroundColor(Color.text.primary)
                                    .background(Color.background.secondary)
                            }
                        

                        VStack {
                            allCampaign
                        }
                        .background(Color.background.primary)
                        .cornerRadius(15)
                        
                    }

            }
          
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            HomeView()
                .navigationBarHidden(true)
                
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .environmentObject(dev.homeViewModel)
    }
}

extension HomeView {
    private var categories: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment:.top, spacing: 15){
                VStack(spacing: 8) {
                    
                    NavigationLink {
                        CampaignScreenWithCategories(campaign: viewModel.popularCampaigns, text: "Popüler Kampanyalar")
                    } label: {
                        Image(systemName: "star.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.text.primary)
                            .frame(width: 64,height: 64)
                            .background(Color.colors.yellow)
                            .cornerRadius(64)
                        
                    }
                    Text("Popüler")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color.text.primary)
                        .lineLimit(2)
                    
                    
                }
                .frame(width: 64)
                .padding(.leading)
                
                if viewModel.expiringCampaigns.count != 0 {
                    VStack(spacing: 8) {
                        
                        NavigationLink {
                            CampaignScreenWithCategories(campaign: viewModel.expiringCampaigns, text: "Yakında Bitecekler")
                        } label: {
                            Image(systemName: "timer")
                                .font(.largeTitle)
                                .foregroundColor(Color.text.primary)
                                .frame(width: 64,height: 64)
                                .background(Color.colors.red)
                                .cornerRadius(64)
                        }
                        Text("Yakında Bitecek")
                            .font(.subheadline)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color.text.primary)
                            .lineLimit(2)
                    }
                    .frame(width: 64)
                }
                
                ForEach(viewModel.categories) { category  in
                    NavigationLink {
                        CampaignScreenWithCategories(campaign: viewModel.allCampaigns.filter({$0.categoryID == category.id}), text: category.name)
                    } label: {
                        VStack(spacing: 8) {
                            Image(systemName: category.imageURL)
                                .font(.largeTitle)
                                .foregroundColor(Color.text.primary)
                                .frame(width: 64,height: 64)
                                .background(Color.background.primary)
                                .cornerRadius(64)
                            Text(category.name)
                                .font(.footnote)
                                .multilineTextAlignment(.center)
                                .foregroundColor(Color.text.primary)
                        }
                        .frame(width:64)
                    }
                    
                }
            }
        }
    }
    private var allCampaign: some View {
        VStack {
            HStack{
                Text("Tüm Kampanyalar")
                    .foregroundColor(Color.text.primary)
                    .font(.headline)
                    .bold()
                    
            }
            .padding()
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(viewModel.allCampaigns) { campaign in
                        NavigationLink {
                            CampaignDetailView(campaign: campaign)
                        } label: {
                            CampaignRowView(campaign: campaign)
                        }
                    }
                    .padding(3)
                }
                .padding(15)
            }
            .frame(minWidth: UIScreen.main.bounds.width,minHeight: UIScreen.main.bounds.height / 2.2)
        }
    }
    
}


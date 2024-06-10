//
//  SettingsView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 10.08.2023.
//

import SwiftUI

struct SettingsView: View {
    
    let privacyPolicyURL = URL(string: "https://priper.com.tr/gizlilik-politikasi")!
    let termsOfServiceURL = URL(string: "https://priper.com.tr/cerez-politikasi")!
    let companyWebsiteURL = URL(string: "https://priper.com.tr")!
    
    @Environment(\.openURL) var openURL
    private var email = Support(toAddress: "ahmetpurtuloglu@gmail.com", subject: "Support", messageHeader: "send me a message")
    
    var body: some View {
        
        
        VStack {
            
            List {
                Section(header: Text("Info")) {
                    Link("Company Website", destination: companyWebsiteURL)
                    Link("Privacy Policy", destination: privacyPolicyURL)
                    Link("Terms of Service", destination: termsOfServiceURL)
                    
                    
                }
                Section {
                    Button {
                        email.send(openURL: openURL)
                    } label: {
                        Text("Eksik,hata,görüş ve önerileri bildirin")
                            .font(.body)
                            .foregroundColor(.orange)
                        
                    }
                    
                } header: {
                    Text("Contact Us")
                    
                }
            }
        }.navigationTitle("Ayarlar")
        
    }
    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

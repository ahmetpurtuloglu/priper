//
//  InfoView.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 10.08.2023.
//

import SwiftUI

struct InfoView: View {
    let privacyPolicyURL = URL(string: "https://priper.com.tr/gizlilik-politikasi")!
    let termsOfServiceURL = URL(string: "https://priper.com.tr/cerez-politikasi")!
    let companyWebsiteURL = URL(string: "https://priper.com.tr")!
    let contactUs = URL(string: "https://priper.com.tr/kullanim-kosullari")!
    
    var body: some View {
            
        VStack(alignment:.leading) {
            
            HStack {
                XMarkButton()
                Spacer()
            }
            .padding()
            Spacer()
            
            List {
                priperSection
                infoSection
            }
            .listStyle(InsetListStyle())
            
        }
    }
}


struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

extension InfoView {
    private var priperSection: some View {
        Section(header: Text("PRIPER")) {
            VStack(alignment:.leading){
                Image("prıper")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 25))

            }
            .padding(.vertical)
        }
    }
    private var infoSection: some View {
        Section(header: Text("Info")) {
            Link("Terms of Service", destination: termsOfServiceURL)
            Link("Privacy Policy", destination: privacyPolicyURL)
            Link("Company Website", destination: companyWebsiteURL)
            Link("Contact Us", destination: contactUs)
        }
        
    }
}


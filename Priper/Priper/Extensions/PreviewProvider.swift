//
//  PreviewProvider.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation
import SwiftUI

extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    
    static let instance = DeveloperPreview()
    private init() { }
    
    let homeViewModel = HomeViewModel()

    
    let campaign = CampaignModel(
        id:1,
        categoryID:4,
        categoryName:"Banka",
        expiringSoon:false,
        timeLeftTurkish:"Promosyon Bitti",
        name:"AKBANK",
        detailsShort:"Yakınlarınızı Akbanka davet edin 1.500 TL'ye varan chip-para kazanın",
        details:"Davet Et Kazan kampanyasıyla Akbanklılar, kendileri için özel olarak oluşturulan davet kodlarıyla yakınlarını mobilden Akbanklı olmaya davet ediyor. Davet kodu ile mobildenAkbanklı olan her yakınınız için 150 TL, toplam 1.500 TL chip-para kazanabilirsiniz. üstelik davet koduyla Akbanklı olan yakınlarınız da Axess veya Wings kartlarından ilk kez yapacakları harcamalarından 150 TL, üniversiteli Akbanklı olduklarında ise 100 TL daha toplamda 250 TL chip-para kazanabilir.",
        imageURL:"https://www.akbank.com/SiteAssets/img/akbfa.jpg",
        promotionURL:"https://www.akbank.com/tr-tr/kampanyalar/Sayfalar/davet-et-kazan.aspx",
        promoCode:"1000100298665",
        dateAdded:"Fri, 31 Mar 2023 17:33:45 GMT",
        dateEdited:"Tue, 04 Apr 2023 11:56:50 GMT",
        dateExpiring:"Sun, 30 Apr 2023 00:00:00 GMT",
        expired:true,
        popular:true,
        dateExpiringTurkish:"30 Nisan, 2023"
       )
    
    
}

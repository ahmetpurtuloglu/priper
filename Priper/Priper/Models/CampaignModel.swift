//
//  CampaignModel.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 7.08.2023.
//

import Foundation

struct CampaignModel:Identifiable,Codable {
    
    let id: Int
    let categoryID: Int
    let categoryName: String
    let expiringSoon: Bool
    let timeLeftTurkish: String
    let name: String
    let detailsShort: String
    let details: String
    let imageURL: String
    let promotionURL: String
    let promoCode: String
    let dateAdded: String
    let dateEdited: String
    let dateExpiring: String
    let expired: Bool
    let popular: Bool
    let dateExpiringTurkish:String
    
    enum CodingKeys: String,CodingKey {
        case id = "id"
        case categoryID = "category_id"
        case categoryName = "category_name"
        case expiringSoon = "expiring_soon"
        case timeLeftTurkish = "time_left_turkish"
        case name = "name"
        case detailsShort = "details_short"
        case details = "details"
        case imageURL = "image_url"
        case promotionURL = "promotion_url"
        case promoCode = "promo_code"
        case dateAdded = "date_added"
        case dateEdited = "date_edited"
        case dateExpiring = "date_expiring"
        case expired = "expired"
        case popular = "popular"
        case dateExpiringTurkish = "date_expiring_turkish"
    }
    
}
/*
 
 {
 "category_id":4,
 "category_name":"Banka",
 "date_added":"Fri, 31 Mar 2023 17:33:45 GMT",
 "date_edited":"Tue, 04 Apr 2023 11:56:50 GMT",
 "date_expiring":"Sun, 30 Apr 2023 00:00:00 GMT",
 "date_expiring_turkish":"30 Nisan, 2023",
 "details":"\u2022Davet Et Kazan kampanyas\u0131yla Akbankl\u0131lar, kendileri i\u00e7in \u00f6zel olarak olu\u015fturulan davet kodlar\u0131yla yak\u0131nlar\u0131n\u0131 mobilden Akbankl\u0131 olmaya davet ediyor. \r\n\r\n\u2022Davet kodu ile mobilden Akbankl\u0131 olan her yak\u0131n\u0131n\u0131z i\u00e7in 150 TL, toplam 1.500 TL chip-para kazanabilirsiniz. \r\n\r\n\u2022\u00dcstelik davet koduyla Akbankl\u0131 olan yak\u0131nlar\u0131n\u0131z da Axess veya Wings kartlar\u0131ndan ilk kez yapacaklar\u0131 harcamalar\u0131ndan 150 TL, \u00dcniversiteli Akbankl\u0131 olduklar\u0131nda ise 100 TL daha toplamda 250 TL chip-para kazanabilir.",
 "details_short":"Yak\u0131nlar\u0131n\u0131z\u0131 Akbank\u2019a davet edin 1.500 TL\u2019ye varan chip-para kazan\u0131n!",
 "expired":true,
 "expiring_soon":false,
 "id":1,
 "image_url":"https://www.akbank.com/SiteAssets/img/akbfa.jpg",
 "name":"AKBANK",
 "popular":true,
 "promo_code":"1000100298665",
 "promotion_url":"https://www.akbank.com/tr-tr/kampanyalar/Sayfalar/davet-et-kazan.aspx",
 "time_left_turkish":"Promosyon Bitti"
 
 }
 */



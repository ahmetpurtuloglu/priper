//
//  Support.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 10.08.2023.
//

import Foundation
import SwiftUI

struct Support {
    let toAddress:String
    let subject:String
    let messageHeader: String
    func send(openURL:OpenURLAction){
        let urlString = "mailto:\(toAddress)?subject=\(subject.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")"
        guard let url = URL(string: urlString) else {return}
        openURL(url){ accepted in
            if !accepted {
                print("this device doesn't support email")
            }
            
        }
        
    }
}


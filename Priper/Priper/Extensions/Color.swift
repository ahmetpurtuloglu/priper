//
//  Color.swift
//  Priper
//
//  Created by Ahmet Purtuloglu on 10.08.2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let text = ColorText()
    static let background = ColorBackground()
    static let colors = Colors()
    
    struct ColorBackground {
        
        let primary = Color("Background")
        let secondary = Color("Background 2")
        let backgroundThird = Color("Background 3")
    }
    
    struct ColorText {
        
        let primary = Color("Text")
        let secondary = Color("Text 2")
        let textThird = Color("Text 3")
    }
    
    struct Colors {
        let red = Color("Red")
        let yellow = Color("Yellow")
    }
}


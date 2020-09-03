//
//  UIFont+Extension.swift
//  Escola de Negócios do Itaú
//
//  Created by Matheus Falcão on 09/02/2019.
//  Copyright © 2019 NOCLAF TECH. All rights reserved.
//

import UIKit

enum FontType : CaseIterable {
    case regular
    case bold
    case light
    
}

extension UIFont {
    
    static var fontName = "Roboto-Regular"
    
    static var lightFontName = "Roboto-Light"
    
    static var boldFontName = "Roboto-Bold"
    
    static func defaultFont(size : CGFloat, type : FontType) -> UIFont {
        
        switch type {
            
        case .regular:
            return UIFont(name: fontName, size: size)!
            
        case .bold:
            return UIFont(name: boldFontName, size: size)!
            
        case .light:
            return UIFont(name: lightFontName, size: size)!
            
            
            
        }
        
    }
    
}

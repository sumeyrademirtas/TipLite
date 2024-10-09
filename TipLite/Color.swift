//
//  Color.swift
//  TipLite
//
//  Created by Sümeyra Demirtaş on 10/8/24.
//

import UIKit

extension UIColor {
    // creating UIColor by using HEX code
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
    
    // Custom color names
      static var lightGreen: UIColor {
          return UIColor(hex: "D6F4E7")
      }
    
    static var darkGreen: UIColor {
        return UIColor(hex: "4DA36C")
    }
}
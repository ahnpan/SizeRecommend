//
//  Size.swift
//  SizeRecommend
//
//  Created by Ruby Vega on 9/2/25.
//

import Foundation

public enum Size {
    case small
    case medium
    case large
    case extraLarge
    
    public var name: String {
        switch self {
        case .small:
            return "Small"
        case .medium:
            return "Medium"
        case .large:
            return "Large"
        case .extraLarge:
            return "Extra Large"
        }
    }
}

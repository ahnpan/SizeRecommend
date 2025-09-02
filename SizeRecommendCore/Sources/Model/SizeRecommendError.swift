//
//  Untitled.swift
//  SizeRecommend
//
//  Created by Ruby Vega on 9/2/25.
//

import Foundation

public enum SizeRecommendError: LocalizedError, Equatable {
    
    case invalidHeight
    case invalidWeight
    case invalidBMI
    case custom(message: String)
    
    public var errorDescription: String? {
        switch self {
        case .invalidHeight:
            return "Invalid input height."
        case .invalidWeight:
            return "Invalid input weight."
        case .invalidBMI:
            return "Invalid BMI value."
        case .custom(let message):
            return message
        }
    }
    
    public var errorMessage: String? {
        switch self {
        case .invalidHeight:
            return "Invalid input height. Please input a value greater than 0."
        case .invalidWeight:
            return "Invalid input weight. Please input a value greater than 0."
        case .invalidBMI:
            return "Invalid BMI value. Please check if your input height and weight is greater than 0."
        case .custom(let message):
            return message
        }
    }
}
